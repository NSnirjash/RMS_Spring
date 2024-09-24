package com.Project.RMSSpring.service;


import com.Project.RMSSpring.entity.*;
import com.Project.RMSSpring.repository.ApproveOrderRepository;
import com.Project.RMSSpring.repository.OrderRepository;
import com.Project.RMSSpring.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ApproveOrderService {


    @Autowired
    private ApproveOrderRepository approveOrderRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private OrderRepository orderRepository;

//    public ApproveOrder approveOrder(ApproveOrder approve) {
//        // Fetch the booking and admin details
//        User admin = userRepository.findById(approve.getAdmin().getId()).orElseThrow(() -> new RuntimeException("Admin not found"));
//
//        Order order = orderRepository.findById(Math.toIntExact(approve.getOrder().getId())).orElseThrow(() -> new RuntimeException("User not found"));
//
//        // Create a new TableApproval instance and set the approved booking and admin
//        // ApprovedOrder তৈরি করতে
//        ApproveOrder approvedOrder = new ApproveOrder();
//        approvedOrder.setAdmin(admin);  // এডমিন হিসেবে সেট করা
//        approvedOrder.setOrder(order);        // অর্ডার সেট করা
//        approvedOrder.setApprovalStatus("APPROVED");
//        // Update the booking status to APPROVED
//        approvedOrder.setApprovalStatus("APPROVED");
//
//        // Save the approval and return
//        return approveOrderRepository.save(approvedOrder);
//    }

//    public ApproveOrder approveOrder(int orderId, Long adminId) {
//        // Fetch the admin and order details
//        User admin = userRepository.findById(adminId)
//                .orElseThrow(() -> new RuntimeException("Admin not found"));
//
//        Order order = orderRepository.findById(orderId)
//                .orElseThrow(() -> new RuntimeException("Order not found"));
//
//        // Create and set ApproveOrder details
//        ApproveOrder approvedOrder = new ApproveOrder();
//        approvedOrder.setAdmin(admin);  // Set Admin
//        approvedOrder.setOrder(order);  // Set Order
//        approvedOrder.setApprovalStatus("APPROVED");
//
//        // Save and return the approved order
//        return approveOrderRepository.save(approvedOrder);
//    }

    public ApproveOrder approveOrder(int orderId, Long adminId, long staffId) {
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

        // Update order status to APPROVED
        order.setStatus("APPROVED");
        orderRepository.save(order); // Save the order with updated status

        // Create and set ApproveOrder details
        ApproveOrder approvedOrder = new ApproveOrder();
        approvedOrder.setAdmin(admin);  // Set Admin
        approvedOrder.setStaff(staff);
        approvedOrder.setOrder(order);  // Set Order
        approvedOrder.setApprovalStatus("APPROVED");
        approvedOrder.setApproved(true);

        // Save and return the approved order
        return approveOrderRepository.save(approvedOrder);
    }

    public List<ApproveOrder> getAllApprovedOrders() {
        return approveOrderRepository.findAll();
    }

    public ApproveOrder serveOrder(Long orderId, Long staffId) {

        User staff = userRepository.findById(staffId)
                .orElseThrow(() -> new RuntimeException("Staff not found"));

        ApproveOrder approveOrder = approveOrderRepository.findById(orderId)
                .orElseThrow(() -> new RuntimeException("Order not found"));

        ApproveOrder serveOrder = new ApproveOrder();
        serveOrder.setStaff(staff);
        serveOrder.setOrder(approveOrder.getOrder());
        serveOrder.setApprovalStatus("APPROVED");
        serveOrder.setApprovalStatus("SERVED");



        return approveOrderRepository.save(approveOrder);
    }
}



