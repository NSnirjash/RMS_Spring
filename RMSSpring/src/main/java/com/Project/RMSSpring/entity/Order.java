package com.Project.RMSSpring.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Entity
@Table(name = "orderFood")
@Data
@NoArgsConstructor
@AllArgsConstructor

public class Order implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "userId", nullable = false)
    private User user; // The customer who places the order

    @ManyToOne
    @JoinColumn(name = "foodId")
    private Food food; // The food item being ordered

    @Column(nullable = false)
    private int quantity; // Quantity of the food item

    @Column(nullable = false)
    private String status; // Status of the order (PENDING, APPROVED, REJECTED,  )

    @Column(nullable = false)
    private double totalPrice; // Total price of the order (food price * quantity)

    @ManyToOne
    @JoinColumn(name = "admin_id", referencedColumnName = "id")
    private User admin; // Admin who approves the order

    @ManyToOne
    @JoinColumn(name = "staff_id", referencedColumnName = "id")
    private User staff; // Staff who serves the food

    private String notes;

    // A single bill for this order
    @JsonManagedReference
    @OneToOne(mappedBy = "order", cascade = CascadeType.ALL)
    private Bill bill;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "orderDetails_id", nullable = false)
    @JsonIgnore
    private OrderDetails orderDetails;

}
