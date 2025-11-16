package com.example.demo1.dao;

import com.example.demo1.Order;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class OrderDAO {
    private static final List<Order> orders = List.of(
        new Order(101, LocalDate.parse("2025-01-15"), "PAID", 24.50),
        new Order(102, LocalDate.parse("2025-02-10"), "PAID", 30.50),
        new Order(103, LocalDate.parse("2025-03-22"), "PAID", 15.50),
        new Order(104, LocalDate.parse("2025-04-02"), "PAID", 43.50),
        new Order(105, LocalDate.parse("2025-04-15"), "PAID", 21.00),
        new Order(106, LocalDate.parse("2025-05-01"), "PAID", 22.50),
        new Order(107, LocalDate.parse("2025-06-11"), "PAID", 19.00),
        new Order(108, LocalDate.parse("2025-07-03"), "PAID", 27.80),
        new Order(109, LocalDate.parse("2025-08-14"), "PAID", 33.00),
        new Order(110, LocalDate.parse("2025-09-27"), "PAID", 41.20),
        new Order(111, LocalDate.parse("2025-10-08"), "PAID", 56.00),
        new Order(112, LocalDate.parse("2025-11-01"), "PAID", 38.50)
    );

    public List<Order> getAllOrders() {
        return new ArrayList<>(orders);
    }

    public List<Order> getOrdersBetween(LocalDate start, LocalDate end) {
        if (start == null || end == null) {
            return getAllOrders();
        }
        return orders.stream()
                .filter(order -> !order.getOrderDate().isBefore(start) && !order.getOrderDate().isAfter(end))
                .collect(Collectors.toList());
    }
}

