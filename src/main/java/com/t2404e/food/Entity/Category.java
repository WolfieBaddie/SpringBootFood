package com.t2404e.food.Entity;
import jakarta.persistence.*;
import lombok.*;
@Entity @Table(name = "categories")
@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable=false, length=150, unique=true)
    private String name;
}
