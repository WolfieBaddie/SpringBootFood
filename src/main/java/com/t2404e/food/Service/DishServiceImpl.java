package com.t2404e.food.Service;
import com.t2404e.food.Common.PageResponse;
import com.t2404e.food.Entity.*;
import com.t2404e.food.Enums.DishStatus;
import com.t2404e.food.Repository.*;
import com.t2404e.food.Spec.DishSpectifications;
import com.t2404e.food.Service.DishService;
import com.t2404e.food.Dto.*;
import com.t2404e.food.Mapper.DishMapper;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.*;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.util.Objects;

@Service @RequiredArgsConstructor
public class DishServiceImpl implements DishService  {
    private final DishRepository dishRepo;
    private final CategoryRepository categoryRepo;

    @Override
    public PageResponse<DishDto> search(Integer page, Integer limit, String sortBy, String sortDir,
                                        String status, String keyword, Long categoryId,
                                        String minPrice, String maxPrice) {

        int p = (page == null || page < 1) ? 1 : page;
        int l = (limit == null || limit < 1) ? 5 : limit;

        String sb = StringUtils.hasText(sortBy) ? sortBy : "startDate";
        Sort.Direction dir = "asc".equalsIgnoreCase(sortDir) ? Sort.Direction.ASC : Sort.Direction.DESC;

        Pageable pageable = PageRequest.of(p - 1, l, Sort.by(dir, sb));

        Specification<Dish> spec = Specification.where(DishSpectifications.notDeleted());

        // status: default ON_SALE (theo đề bài)
        DishStatus desired = DishStatus.ON_SALE;
        if (StringUtils.hasText(status)) {
            if ("ON_SALE".equalsIgnoreCase(status)) desired = DishStatus.ON_SALE;
            else if ("STOPPED".equalsIgnoreCase(status)) desired = DishStatus.STOPPED;
            else desired = DishStatus.ON_SALE; // fallback
        }
        spec = spec.and(DishSpectifications.hasStatus(desired));

        if (StringUtils.hasText(keyword)) {
            spec = spec.and(DishSpectifications.keyword(keyword));
        }
        if (categoryId != null) {
            spec = spec.and(DishSpectifications.categoryId(categoryId));
        }
        if (StringUtils.hasText(minPrice)) {
            spec = spec.and(DishSpectifications.minPrice(new BigDecimal(minPrice)));
        }
        if (StringUtils.hasText(maxPrice)) {
            spec = spec.and(DishSpectifications.maxPrice(new BigDecimal(maxPrice)));
        }

        Page<Dish> pageData = dishRepo.findAll(spec, pageable);
        return PageResponse.<DishDto>builder()
                .content(pageData.getContent().stream().map(DishMapper::toDto).toList())
                .page(p)
                .limit(l)
                .totalPages(pageData.getTotalPages())
                .totalElements(pageData.getTotalElements())
                .build();
    }

    @Override
    public DishDto getById(String id) {
        Dish d = dishRepo.findById(id).orElseThrow(() -> new EntityNotFoundException("Dish not found"));
        if (d.getStatus() == DishStatus.DELETED) throw new EntityNotFoundException("Dish not found");
        return DishMapper.toDto(d);
    }

    @Override
    public DishDto create(DishCreateRequest req) {
        Category cat = categoryRepo.findById(req.getCategoryId())
                .orElseThrow(() -> new EntityNotFoundException("Category not found"));

        Dish entity = Dish.builder()
                .name(req.getName().trim())
                .description(req.getDescription())
                .imageUrl(req.getImageUrl())
                .price(req.getPrice())
                .status(DishStatus.ON_SALE)          // theo yêu cầu
                .category(cat)
                .build();

        entity = dishRepo.save(entity);
        return DishMapper.toDto(entity);
    }

    @Override
    public DishDto update(String id, DishUpdateRequest req) {
        Dish d = dishRepo.findById(id).orElseThrow(() -> new EntityNotFoundException("Dish not found"));
        if (d.getStatus() == DishStatus.DELETED) {
            throw new IllegalStateException("Cannot update a deleted dish");
        }
        Category cat = categoryRepo.findById(req.getCategoryId())
                .orElseThrow(() -> new EntityNotFoundException("Category not found"));

        d.setName(req.getName().trim());
        d.setDescription(req.getDescription());
        d.setImageUrl(req.getImageUrl());
        d.setPrice(req.getPrice());

        // chỉ cho phép ON_SALE / STOPPED
        DishStatus newStatus = Objects.equals(req.getStatus(), "STOPPED") ? DishStatus.STOPPED : DishStatus.ON_SALE;
        d.setStatus(newStatus);

        d.setCategory(cat);
        return DishMapper.toDto(dishRepo.save(d));
    }

    @Override
    public void softDelete(String id) {
        Dish d = dishRepo.findById(id).orElseThrow(() -> new EntityNotFoundException("Dish not found"));
        if (d.getStatus() == DishStatus.DELETED) {
            throw new IllegalStateException("Dish already deleted");
        }
        d.setStatus(DishStatus.DELETED);
        dishRepo.save(d);
    }
}
