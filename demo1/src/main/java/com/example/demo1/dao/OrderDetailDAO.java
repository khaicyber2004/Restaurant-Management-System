package com.example.demo1.dao;

import com.example.demo1.Order;
import com.example.demo1.OrderDetail;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class OrderDetailDAO {
    private static final List<OrderDetail> orderDetails = List.of(
        new OrderDetail(1, 101, 1, 2, 4.50, 9.00),
        new OrderDetail(2, 101, 2, 2, 5.00, 10.00),
        new OrderDetail(3, 101, 5, 1, 5.50, 5.50),

        new OrderDetail(4, 102, 1, 3, 4.50, 13.50),
        new OrderDetail(5, 102, 5, 2, 3.00, 6.00),
        new OrderDetail(6, 102, 9, 1, 6.00, 6.00),
        new OrderDetail(7, 102, 2, 1, 5.00, 5.00),

        new OrderDetail(8, 103, 1, 1, 4.50, 4.50),
        new OrderDetail(9, 103, 11, 1, 6.00, 6.00),
        new OrderDetail(10, 103, 15, 1, 3.00, 3.00),

        new OrderDetail(11, 104, 1, 4, 4.50, 18.00),
        new OrderDetail(12, 104, 8, 1, 12.00, 12.00),
        new OrderDetail(13, 104, 7, 1, 7.50, 7.50),
        new OrderDetail(14, 104, 5, 2, 3.00, 6.00)
    );

    public List<OrderDetail> getAllDetails() {
        return new ArrayList<>(orderDetails);
    }

    public List<OrderDetail> getOrderDetailsByOrderId(int orderId) {
        return orderDetails.stream()
                .filter(detail -> detail.getOrderId() == orderId)
                .collect(Collectors.toList());
    }

    public List<OrderDetail> getOrderDetailsByDishId(int dishId) {
        return orderDetails.stream()
                .filter(detail -> detail.getDishId() == dishId)
                .collect(Collectors.toList());
    }

    public int getTotalQuantityByDishId(int dishId) {
        return orderDetails.stream()
                .filter(detail -> detail.getDishId() == dishId)
                .mapToInt(OrderDetail::getQuantity)
                .sum();
    }

    public double getTotalRevenueByDishId(int dishId) {
        return orderDetails.stream()
                .filter(detail -> detail.getDishId() == dishId)
                .mapToDouble(OrderDetail::getAmount)
                .sum();
    }

    public List<OrderDetail> getOrderDetailsByDishIdAndDate(int dishId, LocalDate start, LocalDate end) {
        if (start == null || end == null) {
            return getOrderDetailsByDishId(dishId);
        }
        
        OrderDAO orderDAO = new OrderDAO();
        List<Order> ordersInRange = orderDAO.getOrdersBetween(start, end);
        
        return orderDetails.stream()
                .filter(detail -> detail.getDishId() == dishId)
                .filter(detail -> ordersInRange.stream()
                        .anyMatch(order -> order.getOrderId() == detail.getOrderId()))
                .collect(Collectors.toList());
    }
}

