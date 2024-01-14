//
//  FoodType.swift
//  CountApp
//
//  Created by Sam Sung on 1/13/24.
//

import SwiftUI

enum FoodType: String, CaseIterable, Codable {
    case korean = "한식"
    case western = "양식"
    case japanese = "일식"
    case chinese = "중식"
    case asian = "아시안"
}

extension FoodType {
    var themeColor: Color {
        switch self {
        case .korean:
            return .green
        case .western:
            return .blue
        case .japanese:
            return .pink
        case .chinese:
            return .red
        case .asian:
            return .yellow
        }
    }
}
