//
//  AddFoodButton.swift
//  LunchCounter
//
//  Created by Sam Sung on 1/13/24.
//

import SwiftUI

struct AddFoodButton: View {
    let type: FoodType
    var action: (() -> Void)
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Circle()
                .frame(width: 60, height: 60)
                .foregroundStyle(type.themeColor)
                .overlay {
                    Text(type.rawValue)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                }
        })
    }
}

#Preview {
    AddFoodButton(type: .asian) {
        print("Did tapped")
    }
}
