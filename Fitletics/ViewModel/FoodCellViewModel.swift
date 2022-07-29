//
//  FoodCellViewModel.swift
//  Fitletics
//
//  Created by Ali YILMAZ on 27.07.2022.
//

import Foundation

struct FoodCellViewModel {
    
    private let food: Food
    
    var calorie : Double {
        return food.calories
    }
    
    var protein : Double {
        return food.protein_g
    }
    
    var carb : Double {
        return food.carbohydrates_total_g
    }
    
    var size : Double {
        return food.serving_size_g
    }
    
    var name : String {
        return food.name
    }
    
    init(food:Food){
        self.food = food
    }
    
    
}
