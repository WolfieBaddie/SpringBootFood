package com.t2404e.food.Service;

import com.t2404e.food.Common.PageResponse;
import com.t2404e.food.Dto.*;

public interface DishService {
    PageResponse<DishDto> search(
            Integer page, Integer limit, String sortBy, String sortDir,
            String status, String keyword, Long categoryId,
            String minPrice, String maxPrice
    );

    DishDto getById(String id);

    DishDto create(DishCreateRequest req);

    DishDto update(String id, DishUpdateRequest req);

    void softDelete(String id);
}
