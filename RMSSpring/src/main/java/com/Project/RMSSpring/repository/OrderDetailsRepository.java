package com.Project.RMSSpring.repository;

import com.Project.RMSSpring.entity.OrderDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

public interface OrderDetailsRepository extends JpaRepository<OrderDetails, Long> {


}
