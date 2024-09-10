package com.Project.RMSSpring.entity;



import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "tables")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Tables {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique=true, nullable=false, length=50)
    private String tableNumber;

    @Column(unique=true, nullable=false, length=50)
    private int capacity;

    @Column(unique=true, nullable=false, length=50)
    private String status;

}
