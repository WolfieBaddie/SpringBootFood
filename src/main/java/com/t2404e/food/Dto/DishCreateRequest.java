package com.t2404e.food.Dto;
import jakarta.validation.constraints.*;
import lombok.*;
import java.math.BigDecimal;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
public class DishCreateRequest {
    @NotBlank @Size(min=8, message="name must have > 7 characters")
    private String name;

    private String description;

    @Pattern(regexp="^https?://.*", message="imageUrl must be a valid URL")
    private String imageUrl;

    @NotNull @DecimalMin(value="0.01", message="price must be > 0")
    private BigDecimal price;

    @NotNull
    private Long categoryId;
}
