package com.example.demo1.dto;

import java.time.LocalDate;

public class DishOrderDTO {
    private int orderId;
    private LocalDate orderDate;
    private int quantity;
    private double revenue;

    public DishOrderDTO() {
    }

    public DishOrderDTO(int orderId, LocalDate orderDate, int quantity, double revenue) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.quantity = quantity;
        this.revenue = revenue;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public LocalDate getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDate orderDate) {
        this.orderDate = orderDate;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getRevenue() {
        return revenue;
    }

    public void setRevenue(double revenue) {
        this.revenue = revenue;
    }
}

