package com.t2404e.food.Dto;

import lombok.*;
import java.math.BigDecimal;
import java.time.Instant;
@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class DishDto {
    private String id;
    private String name;
    private String description;
    private String imageUrl;
    private BigDecimal price;
    private Instant startDate;
    private Instant lastModifiedDate;
    private String status;       // "ON_SALE" | "STOPPED" | "DELETED"
    private CategoryDto category;
}
