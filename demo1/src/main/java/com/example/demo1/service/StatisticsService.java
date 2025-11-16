package com.example.demo1.service;

import com.example.demo1.Dish;
import com.example.demo1.Order;
import com.example.demo1.OrderDetail;
import com.example.demo1.dao.DishDAO;
import com.example.demo1.dao.OrderDAO;
import com.example.demo1.dao.OrderDetailDAO;
import com.example.demo1.dto.DishRevenueDTO;
import java.time.LocalDate;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

public class StatisticsService {
    private DishDAO dishDAO = new DishDAO();
    private OrderDAO orderDAO = new OrderDAO();
    private OrderDetailDAO orderDetailDAO = new OrderDetailDAO();

    public List<DishRevenueDTO> getRevenueByDish(LocalDate start, LocalDate end) {
        // 1. Get all orders between start & end
        List<Order> ordersInRange = orderDAO.getOrdersBetween(start, end);

        // 2. Collect all orderIds from those orders
        Set<Integer> orderIds = ordersInRange.stream()
                .map(Order::getOrderId)
                .collect(Collectors.toSet());

        // 3. From OrderDetailDAO, get details that match these IDs
        List<OrderDetail> relevantDetails = orderDetailDAO.getAllDetails().stream()
                .filter(detail -> orderIds.contains(detail.getOrderId()))
                .collect(Collectors.toList());

        // 4. Group by dishId
        Map<Integer, List<OrderDetail>> detailsByDishId = relevantDetails.stream()
                .collect(Collectors.groupingBy(OrderDetail::getDishId));

        // 5. Sum totalQuantity and totalRevenue, then join with dish name
        List<DishRevenueDTO> result = detailsByDishId.entrySet().stream()
                .map(entry -> {
                    int dishId = entry.getKey();
                    List<OrderDetail> details = entry.getValue();

                    // Sum quantities
                    int totalQuantity = details.stream()
                            .mapToInt(OrderDetail::getQuantity)
                            .sum();

                    // Sum amounts (revenue)
                    double totalRevenue = details.stream()
                            .mapToDouble(OrderDetail::getAmount)
                            .sum();

                    // 6. Join with dish name via DishDAO
                    Dish dish = dishDAO.getDishById(dishId);
                    String dishName = (dish != null) ? dish.getDishName() : "Unknown Dish";

                    // 7. Map to DishRevenueDTO
                    return new DishRevenueDTO(dishId, dishName, totalQuantity, totalRevenue);
                })
                // 8. Sort by totalRevenue DESC
                .sorted(Comparator.comparing(DishRevenueDTO::getTotalRevenue).reversed())
                // 9. Return list
                .collect(Collectors.toList());

        return result;
    }
}

