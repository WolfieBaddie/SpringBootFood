package com.t2404e.food.Service;
import com.t2404e.food.Dto.CategoryDto;
import java.util.List;

public interface CategoryService {
    List<CategoryDto> findAll();
}
