package com.Project.RMSSpring.restcontroller;


import com.Project.RMSSpring.entity.ApproveOrder;
import com.Project.RMSSpring.entity.Order;
import com.Project.RMSSpring.entity.TableBooking;
import com.Project.RMSSpring.service.ApproveOrderService;
import com.Project.RMSSpring.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/approveorders")
public class ApproveOrderRestController {

    @Autowired
    private ApproveOrderService approveOrderService;


    // Approve an order
//    @PostMapping("/approve/{orderId}")
//    public ResponseEntity<ApproveOrder> approveOrder(@RequestBody ApproveOrder approveOrder) {
//        ApproveOrder approvedOrder = approveOrderService.approveOrder(approveOrder);
//        return ResponseEntity.ok(approvedOrder);
//    }

    @PutMapping("/approve/{orderId}")
    public ResponseEntity<ApproveOrder> approveOrder(@PathVariable int orderId,
                                                     @RequestParam Long adminId) {
        ApproveOrder approvedOrder = approveOrderService.approveOrder(orderId, adminId);
        return ResponseEntity.ok(approvedOrder);
    }

    // Get all approved orders
    @GetMapping("/all")
    public ResponseEntity<List<ApproveOrder>> getAllApprovedOrders() {
        List<ApproveOrder> approvedOrders = approveOrderService.getAllApprovedOrders();
        return ResponseEntity.ok(approvedOrders);
    }

    // Serve an order
    @PutMapping("/serve/{orderId}")
    public ResponseEntity<ApproveOrder> serveOrder(@PathVariable Long orderId,
                                                   @RequestParam Long staffId) {
        ApproveOrder servedOrder = approveOrderService.serveOrder(orderId, staffId);
        return ResponseEntity.ok(servedOrder);
    }
}