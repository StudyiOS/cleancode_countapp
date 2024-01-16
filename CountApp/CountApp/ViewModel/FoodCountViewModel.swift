//
//  FoodCountViewModel.swift
//  CountApp
//
//  Created by 황홍필 on 2024/01/13.
//

import Foundation

final class FoodCountViewModel {
    
    // MARK: - UIComponents
    var foods: [FoodsImageModel] = [
        FoodsImageModel(foodsImageName: "chicken", foodsColor: .countPink),
        FoodsImageModel(foodsImageName: "friedRice", foodsColor: .countYellow),
        FoodsImageModel(foodsImageName: "hamburger", foodsColor: .countGreen),
        FoodsImageModel(foodsImageName: "noodles", foodsColor: .countBlue),
        FoodsImageModel(foodsImageName: "pizza", foodsColor: .countPurple)
    ]
}
