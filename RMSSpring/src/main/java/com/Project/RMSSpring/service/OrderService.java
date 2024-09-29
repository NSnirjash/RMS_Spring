package com.Project.RMSSpring.service;

import com.Project.RMSSpring.entity.Food;
import com.Project.RMSSpring.entity.Order;
import com.Project.RMSSpring.entity.User;
import com.Project.RMSSpring.repository.FoodRepository;
import com.Project.RMSSpring.repository.OrderRepository;
import com.Project.RMSSpring.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private UserRepository UserRepository;

    @Autowired
    private FoodRepository foodRepository;
    @Autowired
    private UserRepository userRepository;

    public Order createOrder(Order order) {
        User user = UserRepository.findById(order.getUser().getId())
                .orElseThrow(
                        () -> new RuntimeException("User not found " + order.getUser().getId())
                );

        Food food = foodRepository.findById(order.getFood().getId())
                .orElseThrow(
                        () -> new RuntimeException("Food not found " + order.getUser().getId())
                );

//        Food food = order.getFood();
        order.setUser(user);
        order.setFood(food);
        order.setStatus("PENDING");
        // Calculate total price (food price * quantity)
        double totalPrice = (order.getFood().getPrice() * order.getQuantity());
        order.setTotalPrice(totalPrice);
        return orderRepository.save(order);
    }
    // Get all orders
    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }

    // Get orders by user ID (customer-specific orders)
    public List<Order> getOrdersByUserId(Long userId) {
        return orderRepository.findByUserId(userId);
    }

    // Get order by ID
    public Optional<Order> getOrderById(Long id) {
        return orderRepository.findById(id);
    }

    public Order approveOrder(Long orderId, Long adminId, Long staffId) {
        // Fetch the admin and order details
        User admin = userRepository.findById(adminId)
                .orElseThrow(() -> new RuntimeException("Admin not found"));

        User staff = userRepository.findById(staffId)
                .orElseThrow(() -> new RuntimeException("Staff not found"));

        Order order = orderRepository.findById(orderId)
                .orElseThrow(() -> new RuntimeException("Order not found"));

        if (!"PENDING".equals(order.getStatus())) {
            throw new RuntimeException("Order is not in pending state");
        }

        order.setAdmin(admin);  // Set Admin
        order.setStaff(staff);
        order.setStatus("APPROVED");

        return orderRepository.save(order);
    }

    public Order serveOrder(Long orderId) {

        Order order = orderRepository.findById(orderId)
                .orElseThrow(() -> new RuntimeException("Order not found"));

        order.setStatus("SERVED");
        return orderRepository.save(order);
    }

    public Order rejectOrder(Long orderId, Long adminId) {

        Order order = orderRepository.findById(orderId)
                .orElseThrow(() -> new RuntimeException("Order not found"));

        User admin = userRepository.findById(adminId)
                .orElseThrow(() -> new RuntimeException("Admin not found"));

        order.setStatus("REJECTED");
        order.setAdmin(admin);
        return orderRepository.save(order);
    }

    // Update order status (approve/reject by admin)
    public Order updateOrderStatus(Long id, String status) {
        Optional<Order> order = orderRepository.findById(id);
        if (order.isPresent()) {
            Order existingOrder = order.get();
            existingOrder.setStatus(status);
            return orderRepository.save(existingOrder);
        }
        return null;
    }

    // Delete an order
    public void deleteOrder(Long id) {
        orderRepository.deleteById(id);
    }
}
