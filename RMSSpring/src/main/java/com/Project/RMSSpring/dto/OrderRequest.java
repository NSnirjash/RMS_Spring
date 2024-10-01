package com.Project.RMSSpring.dto;

import com.Project.RMSSpring.entity.Order;
import com.Project.RMSSpring.entity.OrderDetails;

import java.util.List;

public class OrderRequest {

    private OrderDetails orderDetails;
    private List<Order> orders;

    // Getters and Setters
    public OrderDetails getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(OrderDetails orderDetails) {
        this.orderDetails = orderDetails;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

}
