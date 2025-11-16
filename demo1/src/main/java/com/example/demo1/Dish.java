package com.example.demo1;

public class Dish {
    private int dishId;
    private String dishName;
    private double price;
    private String status;
    private String description;

    public Dish() {
    }

    public Dish(int dishId, String dishName, double price, String status, String description) {
        this.dishId = dishId;
        this.dishName = dishName;
        this.price = price;
        this.status = status;
        this.description = description;
    }

    public int getDishId() {
        return dishId;
    }

    public void setDishId(int dishId) {
        this.dishId = dishId;
    }

    public String getDishName() {
        return dishName;
    }

    public void setDishName(String dishName) {
        this.dishName = dishName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
