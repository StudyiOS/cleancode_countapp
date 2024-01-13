//
//  FoodType.swift
//  CountApp
//
//  Created by Sam Sung on 1/13/24.
//

import Foundation

enum FoodType: String, CaseIterable, Codable {
    case korean = "한식"
    case western = "양식"
    case japanese = "일식"
    case chinese = "중식"
    case asian = "아시안"
}
