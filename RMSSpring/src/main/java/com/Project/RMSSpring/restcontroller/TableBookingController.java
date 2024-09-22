package com.Project.RMSSpring.restcontroller;


import com.Project.RMSSpring.entity.TableBooking;
import com.Project.RMSSpring.service.TableBookingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/bookings")
@CrossOrigin("*")
public class TableBookingController {

    @Autowired
    private TableBookingService tableBookingService;

    // Get all table bookings
    @GetMapping("/allbooking")
    public List<TableBooking> getAllBookings() {
        return tableBookingService.getAllBookings();
    }

    // Create a new table booking
    @PostMapping("/create")
    public ResponseEntity<TableBooking> createBooking(@RequestBody TableBooking booking) {
        TableBooking createdBooking = tableBookingService.createBooking(booking);
        return ResponseEntity.ok(createdBooking);
    }

    // Get all pending bookings
    @GetMapping("/pending")
    public List<TableBooking> getPendingBookings() {
        return tableBookingService.getPendingBookings();
    }

    // Update a booking
    @PutMapping("/update/{bookingId}")
    public ResponseEntity<TableBooking> updateBooking(@PathVariable Long bookingId,
                                                      @RequestParam Long userId,
                                                      @RequestParam Long tableId) {
        TableBooking updatedBooking = tableBookingService.updateBooking(bookingId, userId, tableId);
        return ResponseEntity.ok(updatedBooking);
    }

    // Cancel a booking
    @DeleteMapping("/cancel/{bookingId}")
    public ResponseEntity<String> cancelBooking(@PathVariable Long bookingId) {
        tableBookingService.cancelBooking(bookingId);
        return ResponseEntity.ok("Booking Cancell Successfully");
    }
}
