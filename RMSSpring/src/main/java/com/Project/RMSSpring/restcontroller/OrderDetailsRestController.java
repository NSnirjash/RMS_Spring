package com.Project.RMSSpring.restcontroller;


import com.Project.RMSSpring.entity.OrderDetails;
import com.Project.RMSSpring.service.OrderDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/oederdetails")
@CrossOrigin("*")
public class OrderDetailsRestController {

    @Autowired
    private OrderDetailsService orderDetailsService;





    @GetMapping("/{id}")
    public ResponseEntity<OrderDetails> getOrderDetailsById(@PathVariable Long id) {
        OrderDetails orderDetails = orderDetailsService.getOrderDetailsById(id);
        return new ResponseEntity<>(orderDetails, HttpStatus.OK);
    }


    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteOrderDetailsById(@PathVariable Long id) {
        orderDetailsService.deleteOrderDetailsById(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}
