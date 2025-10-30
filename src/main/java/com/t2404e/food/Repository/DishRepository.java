package com.t2404e.food.Repository;
import com.t2404e.food.Entity.Dish;
import org.springframework.data.jpa.repository.*;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
public interface DishRepository  extends JpaRepository<Dish, String>, JpaSpecificationExecutor<Dish>{
}
