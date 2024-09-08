package com.Project.RMSSpring.restcontroller;


import com.Project.RMSSpring.entity.Admin;
import com.Project.RMSSpring.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/admin/api")
public class AdminRestController {

    @Autowired
    private AdminService adminService;

    @GetMapping("/view")
    public List<Admin> getAllAdmins() {
        return adminService.getAllAdmins();
    }

    @PostMapping("/save")
    public void saveAdmin(@RequestBody Admin admin) {
        adminService.saveAdmin(admin);
    }

    @DeleteMapping("/Delete")
    public void deleteAdmin(@PathVariable int id) {
        adminService.deleteAdmin(id);
    }

    @PutMapping("/update")
    public  void updateAdmin(@RequestBody Admin admin, @PathVariable int id) {
        adminService.updateAdmin(admin,id);
    }
}
