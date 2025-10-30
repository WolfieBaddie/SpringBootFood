package com.t2404e.food.Mapper;

import com.t2404e.food.Entity.Dish;
import com.t2404e.food.Dto.*;
public class DishMapper {
    public static DishDto toDto(Dish d) {
        if (d == null) return null;
        return DishDto.builder()
                .id(d.getId())
                .name(d.getName())
                .description(d.getDescription())
                .imageUrl(d.getImageUrl())
                .price(d.getPrice())
                .startDate(d.getStartDate())
                .lastModifiedDate(d.getLastModifiedDate())
                .status(d.getStatus().name())
                .category(CategoryMapper.toDto(d.getCategory()))
                .build();
    }
}
