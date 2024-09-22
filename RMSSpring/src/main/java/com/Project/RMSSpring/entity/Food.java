package com.Project.RMSSpring.entity;

import jakarta.persistence.*;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "foods")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Food {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(length = 50, nullable = false, unique = true)
    private String name;

    @Column(length = 50, nullable = false)
    private double price;

    @Column(length = 50, nullable = false)
    private String category;

    @Column(length = 50, nullable = false)
    private boolean available;

    private String image;

}