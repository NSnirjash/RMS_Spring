package com.Project.RMSSpring.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "customers")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Customer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false,length = 50)
    private String name;

    @Column(nullable = false,length = 50, unique = true)
    private String email;

    @Column(nullable = false,length = 50, unique = true)
    private String phone;

    @Column(nullable = false,length = 50)
    private String address;

    @Column(nullable = false)
    private String image;

}
