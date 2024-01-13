//
//  FoodRecord.swift
//  CountApp
//
//  Created by Sam Sung on 1/13/24.
//

import SwiftUI
import SwiftData

@Model
final class LunchRecord {
    var timestamp: Date
    var foodType: FoodType
    var foodName: String
    
    init(foodType: FoodType, foodName: String) {
        self.timestamp = Date()
        self.foodType = foodType
        self.foodName = foodName
    }
}
