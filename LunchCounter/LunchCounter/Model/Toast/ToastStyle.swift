//
//  ToastStyle.swift
//  LunchCounter
//
//  Created by Sam Sung on 1/14/24.
//

import SwiftUI

enum ToastStyle: Equatable {
    case warning
    case success(FoodType)
}

extension ToastStyle {
    var themeColor: Color {
        switch self {
        case .warning:
            return .red
        case .success(let foodType):
            return foodType.themeColor
        }
    }
    
    var iconName: String {
        switch self {
        case .warning:
            return "exclamationmark.triangle.fill"
        case .success(_):
            return "checkmark.circle.fill"
        }
    }
}
