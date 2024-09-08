package com.Project.RMSSpring.service;

import com.Project.RMSSpring.entity.Food;
import com.Project.RMSSpring.repository.FoodRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FoodService {

    @Autowired
    private FoodRepository foodRepository;

    public List<Food> getAllFood() {
        return foodRepository.findAll();
    }
    public Food saveFood(Food food) {
        return foodRepository.save(food);
    }
    public Food updateFood(Food food, int id) {
        return foodRepository.save(food);
    }
    public void deleteFoodById(int id) {
        foodRepository.deleteById(id);
    }
    public Food findFoodById(int id) {
        return foodRepository.findById(id).get();
    }
}
