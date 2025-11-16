package com.example.demo1.dao;

import com.example.demo1.Dish;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class DishDAO {
    private static final List<Dish> dishes = List.of(
        new Dish(1, "Salmon Nigiri", 4.50, "ACTIVE", "Fresh Norwegian salmon served over vinegared rice"),
        new Dish(2, "Tuna Nigiri", 5.00, "ACTIVE", "Premium bluefin tuna, hand-cut daily"),
        new Dish(3, "Ebi Nigiri", 4.00, "ACTIVE", "Sweet boiled shrimp placed over sushi rice"),
        new Dish(4, "Unagi Nigiri", 6.50, "ACTIVE", "Grilled freshwater eel with sweet soy glaze"),
        new Dish(5, "Tamago Nigiri", 3.00, "ACTIVE", "Japanese fluffy egg omelette sushi"),
        new Dish(6, "Hamachi Nigiri", 5.50, "ACTIVE", "Yellowtail with buttery texture and clean taste"),
        new Dish(7, "Ikura Gunkan", 7.50, "ACTIVE", "Soy-marinated salmon roe served in seaweed cup"),
        new Dish(8, "Uni Gunkan", 12.00, "SOLD_OUT", "Premium sea urchin, rich and creamy"),
        new Dish(9, "California Roll", 6.00, "ACTIVE", "Crab stick, avocado, cucumber inside-out roll"),
        new Dish(10, "Spicy Tuna Roll", 6.80, "ACTIVE", "Minced tuna with spicy mayo and scallions"),
        new Dish(11, "Dragon Roll", 8.50, "ACTIVE", "Eel & cucumber roll topped with avocado"),
        new Dish(12, "Rainbow Roll", 9.50, "ACTIVE", "California roll topped with tuna, salmon & hamachi"),
        new Dish(13, "Sake Maki", 4.00, "ACTIVE", "Simple salmon maki with sushi rice and nori"),
        new Dish(14, "Tekka Maki", 4.20, "ACTIVE", "Classic tuna maki roll"),
        new Dish(15, "Kappa Maki", 3.00, "ACTIVE", "Refreshing cucumber roll – vegetarian option"),
        new Dish(16, "Spider Roll", 9.00, "ACTIVE", "Soft-shell crab tempura roll with creamy sauce"),
        new Dish(17, "Wagyu Nigiri", 14.00, "ACTIVE", "A5 Japanese wagyu beef lightly torched"),
        new Dish(18, "Chutoro Nigiri", 9.80, "ACTIVE", "Medium fatty tuna, melt-in-mouth texture"),
        new Dish(19, "Toro Nigiri", 14.50, "ACTIVE", "Premium fatty tuna belly, top-grade luxurious cut"),
        new Dish(20, "Sake Aburi", 6.20, "ACTIVE", "Torch-seared salmon with yuzu pepper & sea salt")
    );

    public List<Dish> getAllDishes() {
        return new ArrayList<>(dishes);
    }

    public List<Dish> searchByName(String keyword) {
        if (keyword == null || keyword.trim().isEmpty()) {
            return getAllDishes();
        }
        
        String lowerKeyword = keyword.toLowerCase().trim();
        return dishes.stream()
                .filter(dish -> dish.getDishName().toLowerCase().contains(lowerKeyword))
                .collect(Collectors.toList());
    }

    public Dish getDishById(int dishId) {
        return dishes.stream()
                .filter(dish -> dish.getDishId() == dishId)
                .findFirst()
                .orElse(null);
    }
}

