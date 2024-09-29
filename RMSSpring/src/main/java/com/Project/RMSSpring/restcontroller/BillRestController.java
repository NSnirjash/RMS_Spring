package com.Project.RMSSpring.restcontroller;

import com.Project.RMSSpring.entity.Bill;
import com.Project.RMSSpring.service.BillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/bills")
public class BillRestController {

    @Autowired
    private BillService billService;

    // Create a new bill for an order
    @PostMapping("/create")
    public ResponseEntity<Bill> createBill(@RequestParam Long orderId,
                                           @RequestParam Long userId
                                           ) {
        Bill bill = billService.createBill(orderId, userId);
        return ResponseEntity.ok(bill);
    }

    // User pays the bill
    @PutMapping("/pay/{billId}")
    public ResponseEntity<Bill> payBill(@PathVariable Long billId) {
        Bill bill = billService.payBill(billId);
        return ResponseEntity.ok(bill);
    }

    // Admin confirms the bill
    @PutMapping("/confirm/{billId}")
    public ResponseEntity<Bill> confirmBill(@PathVariable Long billId,
                                            @RequestParam Long adminId) {
        Bill bill = billService.confirmBill(billId, adminId);
        return ResponseEntity.ok(bill);
    }
}
