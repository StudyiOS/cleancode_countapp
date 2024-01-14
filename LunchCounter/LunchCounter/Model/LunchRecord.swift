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

    init(foodType: FoodType) {
        self.timestamp = Date()
        self.foodType = foodType
    }
}
