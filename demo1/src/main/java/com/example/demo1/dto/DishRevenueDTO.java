package com.example.demo1.dto;

public class DishRevenueDTO {
    private int dishId;
    private String dishName;
    private int totalQuantity;
    private double totalRevenue;

    public DishRevenueDTO() {
    }

    public DishRevenueDTO(int dishId, String dishName, int totalQuantity, double totalRevenue) {
        this.dishId = dishId;
        this.dishName = dishName;
        this.totalQuantity = totalQuantity;
        this.totalRevenue = totalRevenue;
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

    public int getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity(int totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    public double getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(double totalRevenue) {
        this.totalRevenue = totalRevenue;
    }

    @Override
    public String toString() {
        return "DishRevenueDTO{" +
                "dishId=" + dishId +
                ", dishName='" + dishName + '\'' +
                ", totalQuantity=" + totalQuantity +
                ", totalRevenue=" + totalRevenue +
                '}';
    }
}

