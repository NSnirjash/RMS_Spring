package com.Project.RMSSpring.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "approveOrder")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ApproveOrder {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String approvalStatus; // APPROVED, REJECTED

    @OneToOne
    @JoinColumn(name = "order_id", referencedColumnName = "id", nullable = false)
    private Order order;

    @ManyToOne
    @JoinColumn(name = "admin_id", referencedColumnName = "id", nullable = false)
    private User admin; // Admin who approves the order

    @ManyToOne
    @JoinColumn(name = "staff_id", referencedColumnName = "id", nullable = true)
    private User staff; // Staff who serves the food

    @Column(nullable = false)
    private boolean approved;

    @Column(nullable = false)
    private boolean served;

    @Column(nullable = true)
    private String notes;
}
