package com.Project.RMSSpring.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "orderFood")
@Data
@NoArgsConstructor
@AllArgsConstructor

public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "userId", nullable = false)
    private User user; // The customer who places the order

    @ManyToOne
    @JoinColumn(name = "foodId", nullable = false)
    private Food food; // The food item being ordered

    @Column(nullable = false)
    private int quantity; // Quantity of the food item

    @Column(nullable = false)
    private String status; // Status of the order (PENDING, APPROVED, REJECTED, SERVED)

    @Column(nullable = false)
    private double totalPrice; // Total price of the order (food price * quantity)
}
