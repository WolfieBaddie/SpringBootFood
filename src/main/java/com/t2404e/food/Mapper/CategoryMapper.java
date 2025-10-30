package com.t2404e.food.Mapper;

import com.t2404e.food.Entity.Category;
import com.t2404e.food.Dto.CategoryDto;

public class CategoryMapper {
    public static CategoryDto toDto(Category c) {
        return c == null ? null : new CategoryDto(c.getId(), c.getName());
    }
}
