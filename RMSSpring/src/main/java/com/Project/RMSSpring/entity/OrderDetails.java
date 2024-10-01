package com.Project.RMSSpring.entity;


import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "orderDetails")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDetails implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private double finalPrice;


    @JsonIgnore
    @OneToMany(mappedBy = "orderDetails", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<Order> orders;



}
