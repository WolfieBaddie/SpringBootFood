package com.t2404e.food.Dto;
import jakarta.validation.constraints.*;
import lombok.*;
import java.math.BigDecimal;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class DishUpdateRequest {
    @NotBlank @Size(min=8)
    private String name;

    private String description;

    @Pattern(regexp="^https?://.*", message="imageUrl must be a valid URL")
    private String imageUrl;

    @NotNull @DecimalMin(value="0.01")
    private BigDecimal price;

    @NotNull
    private Long categoryId;

    @NotBlank
    private String status; // "ON_SALE" | "STOPPED"
}
