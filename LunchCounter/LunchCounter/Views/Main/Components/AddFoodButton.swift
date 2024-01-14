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
    var longPressAction: (() -> Void)
    
    var body: some View {
        Button(action: { }) {
            Circle()
                .frame(width: 60, height: 60)
                .foregroundStyle(type.themeColor)
                .overlay {
                    Text(type.rawValue)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                }
        }
        .highPriorityGesture(
            TapGesture()
                .onEnded { _ in
                    action()
                }
        )
        .gesture(
            LongPressGesture(minimumDuration: 0.2)
                .onEnded ({ _ in
                    longPressAction()
                })
        )

    }
}

#Preview {
    AddFoodButton(type: .asian) {
        print("Did tapped")
    } longPressAction: {
        print("Long press")
    }
}
