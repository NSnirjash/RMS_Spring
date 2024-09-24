package com.Project.RMSSpring.service;

import com.Project.RMSSpring.entity.Bill;
import com.Project.RMSSpring.entity.Order;
import com.Project.RMSSpring.entity.User;
import com.Project.RMSSpring.repository.BillRepository;
import com.Project.RMSSpring.repository.OrderRepository;
import com.Project.RMSSpring.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class BillService {

    @Autowired
    private BillRepository billRepository;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private UserRepository userRepository;

    // Create a bill for an order
    public Bill createBill(int orderId, Long userId) {
        // Fetch the order and user details
        Order order = orderRepository.findById(orderId)
                .orElseThrow(() -> new RuntimeException("Order not found"));

        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        // Create a new bill
        Bill bill = new Bill();
        bill.setOrder(order);
        bill.setPaidBy(user);
        bill.setBillDate(LocalDateTime.now());
        bill.setTotalAmount(order.getFood().getPrice() * order.getQuantity());
        bill.setStatus("UNPAID");
//        bill.setPaymentMethod(paymentMethod); // Cash or Card

        return billRepository.save(bill);
    }

    // Pay the bill (User pays the bill)
    public Bill payBill(Long billId) {
        Bill bill = billRepository.findById(billId)
                .orElseThrow(() -> new RuntimeException("Bill not found"));

        if (bill.getStatus().equals("UNPAID")) {
            bill.setStatus("PAID");
        }

        return billRepository.save(bill);
    }

    // Confirm the bill (Admin confirms the bill)
    public Bill confirmBill(Long billId, Long adminId) {
        Bill bill = billRepository.findById(billId)
                .orElseThrow(() -> new RuntimeException("Bill not found"));

        User admin = userRepository.findById(adminId)
                .orElseThrow(() -> new RuntimeException("Admin not found"));

        if (bill.getStatus().equals("PAID")) {
            bill.setReceivedBy(admin);
            bill.setStatus("CONFIRMED");
        }

        return billRepository.save(bill);
    }
}
