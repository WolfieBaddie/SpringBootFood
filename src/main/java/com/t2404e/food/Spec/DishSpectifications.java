package com.t2404e.food.Spec;
import com.t2404e.food.Entity.*;
import com.t2404e.food.Enums.DishStatus;
import jakarta.persistence.criteria.JoinType;
import org.springframework.data.jpa.domain.Specification;

import java.math.BigDecimal;
public class DishSpectifications {
    public static Specification<Dish> notDeleted() {
        return (root, q, cb) -> cb.notEqual(root.get("status"), DishStatus.DELETED);
    }
    public static Specification<Dish> hasStatus(DishStatus status) {
        return (root, q, cb) -> cb.equal(root.get("status"), status);
    }
    public static Specification<Dish> keyword(String kw) {
        return (root, q, cb) -> {
            String like = "%" + kw.toLowerCase() + "%";
            return cb.or(
                    cb.like(cb.lower(root.get("name")), like),
                    cb.like(cb.lower(root.get("description")), like)
            );
        };
    }
    public static Specification<Dish> categoryId(Long categoryId) {
        return (root, q, cb) -> {
            var jo = root.join("category", JoinType.INNER);
            return cb.equal(jo.get("id"), categoryId);
        };
    }
    public static Specification<Dish> minPrice(BigDecimal min) {
        return (root, q, cb) -> cb.greaterThanOrEqualTo(root.get("price"), min);
    }
    public static Specification<Dish> maxPrice(BigDecimal max) {
        return (root, q, cb) -> cb.lessThanOrEqualTo(root.get("price"), max);
    }
}
