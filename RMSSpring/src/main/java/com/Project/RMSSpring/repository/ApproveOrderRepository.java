package com.Project.RMSSpring.repository;

import com.Project.RMSSpring.entity.ApproveOrder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ApproveOrderRepository extends JpaRepository<ApproveOrder, Long> {
}
