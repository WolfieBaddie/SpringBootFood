package com.t2404e.food.Controller;

import com.t2404e.food.Common.ApiResponse;
import com.t2404e.food.Common.PageResponse;
import com.t2404e.food.Service.DishService;
import com.t2404e.food.Dto.*;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

@RestController @RequestMapping("/api/v1/dishes")
@RequiredArgsConstructor
public class DishController {
    private final DishService dishService;

    // 3.2 GET /dishes (page/limit/sort/filter)
    @GetMapping
    public ResponseEntity<ApiResponse<PageResponse<DishDto>>> search(
            @RequestParam(required = false) Integer page,
            @RequestParam(required = false) Integer limit,
            @RequestParam(required = false) String sortBy,
            @RequestParam(required = false) String sortDir,
            @RequestParam(required = false, defaultValue = "ON_SALE") String status,
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) Long categoryId,
            @RequestParam(required = false) String minPrice,
            @RequestParam(required = false) String maxPrice
    ) {
        var result = dishService.search(page, limit, sortBy, sortDir, status, keyword, categoryId, minPrice, maxPrice);
        return ResponseEntity.ok(ApiResponse.ok(result));
    }

    // 3.3 GET /dishes/{id}
    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse<DishDto>> getOne(@PathVariable String id) {
        return ResponseEntity.ok(ApiResponse.ok(dishService.getById(id)));
    }

    // 3.4 POST /dishes
    @PostMapping
    public ResponseEntity<ApiResponse<DishDto>> create(@Valid @RequestBody DishCreateRequest req) {
        var created = dishService.create(req);
        return ResponseEntity.status(HttpStatus.CREATED).body(ApiResponse.created(created));
    }

    // 3.5 PUT /dishes/{id}
    @PutMapping("/{id}")
    public ResponseEntity<ApiResponse<DishDto>> update(@PathVariable String id,
                                                       @Valid @RequestBody DishUpdateRequest req) {
        var updated = dishService.update(id, req);
        return ResponseEntity.ok(ApiResponse.ok(updated));
    }

    // 3.6 DELETE /dishes/{id} (soft delete -> 204 No Content)
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> softDelete(@PathVariable String id) {
        dishService.softDelete(id);
        return ResponseEntity.noContent().build();
    }
}
