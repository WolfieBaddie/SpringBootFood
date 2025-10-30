package com.t2404e.food.Service;
import com.t2404e.food.Repository.CategoryRepository;
import com.t2404e.food.Service.CategoryService;
import com.t2404e.food.Dto.CategoryDto;
import com.t2404e.food.Mapper.CategoryMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.stream.Collectors;
import java.util.List;

@Service @RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService{
    private final CategoryRepository categoryRepo;

    @Override
    public List<CategoryDto> findAll() {
        return categoryRepo.findAll().stream()
                .map(CategoryMapper::toDto)
                .collect(Collectors.toList());
    }
}
