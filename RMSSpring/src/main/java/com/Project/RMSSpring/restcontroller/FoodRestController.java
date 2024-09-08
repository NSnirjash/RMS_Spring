package com.Project.RMSSpring.restcontroller;

import com.Project.RMSSpring.entity.Food;
import com.Project.RMSSpring.service.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/food/api")
public class FoodRestController {

    @Autowired
    private FoodService foodService;

    @PostMapping("/save")
    public void saveFood(@RequestBody Food food) {
        foodService.saveFood(food);
    }

    @GetMapping("/view")
    public List<Food> getAllFood() {
        return foodService.getAllFood();
    }

    @DeleteMapping("/delete")
    public void DeleteById(@PathVariable int id) {
        foodService.deleteFoodById(id);
    }

    @PutMapping("/update")
    public void UpdateFood(@RequestBody Food food,@PathVariable int id) {
        foodService.updateFood(food, id);
    }
}
