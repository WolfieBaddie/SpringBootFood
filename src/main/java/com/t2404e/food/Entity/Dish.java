package com.t2404e.food.Entity;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import com.t2404e.food.Enums.DishStatus;
import java.math.BigDecimal;
import java.time.Instant;
@Entity @Table(name="dishes")
@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class Dish {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    @Column(nullable=false, length=200)
    private String name;

    @Column(columnDefinition = "TEXT")
    private String description;

    private String imageUrl;

    @Column(nullable=false, precision=18, scale=2)
    private BigDecimal price;

    @CreationTimestamp
    @Column(nullable=false, updatable=false)
    private Instant startDate;

    @UpdateTimestamp
    private Instant lastModifiedDate;

    @Enumerated(EnumType.STRING)
    @Column(nullable=false, length=16)
    private DishStatus status;

    @ManyToOne(fetch = FetchType.LAZY, optional=false)
    @JoinColumn(name = "category_id")
    private Category category;
}
