package com.t2404e.food.Repository;
import com.t2404e.food.Entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;
public interface CategoryRepository extends JpaRepository<Category, Long>{
}
