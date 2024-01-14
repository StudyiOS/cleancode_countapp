//
//  FoodType.swift
//  CountApp
//
//  Created by Sam Sung on 1/13/24.
//

import SwiftUI
import Charts

enum FoodType: String, CaseIterable, Codable, Plottable {
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
            return .orange
        case .western:
            return .blue
        case .japanese:
            return .pink.opacity(0.8)
        case .chinese:
            return .red
        case .asian:
            return .yellow
        }
    }
}
