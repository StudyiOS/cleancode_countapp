//
//  FoodTapViewModel.swift
//  CountApp
//
//  Created by 황홍필 on 2024/01/15.
//

import Foundation

final class FoodTapViewModel {
    
    // MARK: - UIComponents
    var foods: [FoodsNameModel] = [
        FoodsNameModel(foodsName: "치킨", foodsColor: .countPink),
        FoodsNameModel(foodsName: "볶음밥", foodsColor: .countYellow),
        FoodsNameModel(foodsName: "햄버거", foodsColor: .countGreen),
        FoodsNameModel(foodsName: "국수", foodsColor: .countBlue),
        FoodsNameModel(foodsName: "피자", foodsColor: .countPurple)
    ]
}
