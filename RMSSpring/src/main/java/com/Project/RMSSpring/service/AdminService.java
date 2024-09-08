package com.Project.RMSSpring.service;

import com.Project.RMSSpring.entity.Admin;
import com.Project.RMSSpring.repository.AdminRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminService {

    @Autowired
    private AdminRepository adminRepository;

    public List<Admin> getAllAdmins() {
        return adminRepository.findAll();
    }

    public Admin getAdminById(int id) {
        return adminRepository.findById(id).get();
    }

    public void updateAdmin(Admin admin, int id) {
        adminRepository.save(admin);
    }

    public void saveAdmin(Admin admin) {
        adminRepository.save(admin);
    }

    public void deleteAdmin(int id) {
        adminRepository.deleteById(id);
    }
}
