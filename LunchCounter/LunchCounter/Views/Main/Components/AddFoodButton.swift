//
//  AddFoodButton.swift
//  LunchCounter
//
//  Created by Sam Sung on 1/13/24.
//

import SwiftUI

struct AddFoodButton: View {
    let type: FoodType
    
    var body: some View {
        Button(action: {
            print("\(type) +1")
        }, label: {
            Circle()
                .frame(width: 50, height: 50)
                .foregroundStyle(getCircleColor())
                .overlay {
                    Text(type.rawValue)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                }
        })
    }
    
    private func getCircleColor() -> Color {
        switch type {
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

#Preview {
    AddFoodButton(type: .asian)
}
