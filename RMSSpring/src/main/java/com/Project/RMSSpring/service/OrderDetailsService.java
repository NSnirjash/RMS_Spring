package com.Project.RMSSpring.service;

import com.Project.RMSSpring.entity.Order;
import com.Project.RMSSpring.entity.OrderDetails;
import com.Project.RMSSpring.repository.OrderDetailsRepository;
import com.Project.RMSSpring.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderDetailsService {

    @Autowired
    private OrderDetailsRepository orderDetailsRepository;

    // Save order details
    public OrderDetails saveOrderDetails(OrderDetails orderDetails) {
        return orderDetailsRepository.save(orderDetails);
    }

    // Get all order details
    public List<OrderDetails> getAllOrderDetails() {
        return (List<OrderDetails>) orderDetailsRepository.findAll();
    }

    // Get order details by ID
    public OrderDetails getOrderDetailsById(Long id) {
        return orderDetailsRepository.findById(id).orElseThrow(() -> new RuntimeException("Order details not found"));
    }

    // Delete order details by ID
    public void deleteOrderDetailsById(Long id) {
        orderDetailsRepository.deleteById(id);
    }


    }


