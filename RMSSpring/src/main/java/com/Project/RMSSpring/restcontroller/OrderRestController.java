package com.Project.RMSSpring.restcontroller;


import com.Project.RMSSpring.dto.OrderRequest;
import com.Project.RMSSpring.entity.Order;
import com.Project.RMSSpring.entity.OrderDetails;
import com.Project.RMSSpring.service.OrderDetailsService;
import com.Project.RMSSpring.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/order")
@CrossOrigin("*")
public class OrderRestController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderDetailsService orderDetailsService;

    // Create a new order (Customer)
//    @PostMapping("/create")
//    public ResponseEntity<Order> createOrder(@RequestBody Order order) {
//        Order createdOrder = orderService.createOrder(order);
//        return ResponseEntity.ok(createdOrder);
//    }


//    public ResponseEntity<OrderDetails> saveOrderDetailsWithOrders(
//            @RequestBody OrderRequest request) {
//        try {
//            // Call the service to save OrderDetails along with the list of Orders
//            OrderDetails savedOrderDetails = orderService.saveOrderDetailsWithOrders(
//                    request.getOrderDetails(),
//                    request.getOrders()
//            );
//            // Return a response with the saved entity and HTTP status 201 (Created)
//            return new ResponseEntity<>(savedOrderDetails, HttpStatus.CREATED);
//        } catch (IllegalArgumentException e) {
//            // Return a bad request response for any validation exceptions
//            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
//        } catch (Exception e) {
//            // Return an internal server error for any other exceptions
//            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
//        }
//    }

    @PostMapping("/create")
    public ResponseEntity<OrderDetails> saveOrderDetailsWithOrders(@RequestBody OrderRequest orderDetailsRequest) {
        // Process the order details and orders
        OrderDetails savedOrderDetails = orderService.saveOrderDetailsWithOrders(
                orderDetailsRequest.getOrderDetails(),
                orderDetailsRequest.getOrders()
        );
        return ResponseEntity.ok(savedOrderDetails); // Ensure this is a JSON response
    }

    @GetMapping("/view")
    public ResponseEntity<List<OrderDetails>> getAllOrderDetails() {
        List<OrderDetails> orderDetailsList = orderService.getAllOrderDetails();
        return new ResponseEntity<>(orderDetailsList, HttpStatus.OK);
    }

    @GetMapping("/OrderDetails/{id}")
    public ResponseEntity<OrderDetails> getOrderDetailsById(@PathVariable Long id) {
        OrderDetails orderDetails = orderDetailsService.getOrderDetailsById(id);
        return ResponseEntity.ok(orderDetails);
    }





    // Get all orders (Admin)
    @GetMapping("/all")
    public ResponseEntity<List<Order>> getAllOrders() {
        List<Order> orders = orderService.getAllOrders();
        return ResponseEntity.ok(orders);
    }

    // Get orders by user ID (Customer)
    @GetMapping("/user/{userId}")
    public ResponseEntity<List<Order>> getOrdersByUserId(@PathVariable Long userId) {
        List<Order> orders = orderService.getOrdersByUserId(userId);
        return ResponseEntity.ok(orders);
    }

    // Get order by ID (Admin or Customer)
    @GetMapping("/{id}")
    public ResponseEntity<Order> getOrderById(@PathVariable Long id) {
        Optional<Order> order = orderService.getOrderById(id);
        return order.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    // Update order status (Admin)
    @PutMapping("/update/{id}")
    public ResponseEntity<Order> updateOrderStatus(@PathVariable Long id, @RequestParam String status) {
        Order updatedOrder = orderService.updateOrderStatus(id, status);
        if (updatedOrder != null) {
            return ResponseEntity.ok(updatedOrder);
        }
        return ResponseEntity.notFound().build();
    }

    @PutMapping("/approve/{id}")
    public ResponseEntity<Void> approveOrder(@PathVariable Long id,
                                             @RequestParam Long adminId,
                                             @RequestParam Long staffId) {
        orderService.approveOrder(id, adminId, staffId);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/serve/{id}")
    public ResponseEntity<Void> serveOrder(@PathVariable Long id) {
        orderService.serveOrder(id);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/reject/{id}")
    public ResponseEntity<Void> rejectOrder(@PathVariable Long id,
                                             @RequestParam Long adminId) {
        orderService.rejectOrder(id, adminId);
        return ResponseEntity.ok().build();
    }

    // Delete an order (Admin)
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> deleteOrder(@PathVariable Long id) {
        orderService.deleteOrder(id);
        return ResponseEntity.ok().build();
    }
}
