//
//  AddFoodButtonGroup.swift
//  LunchCounter
//
//  Created by Sam Sung on 1/14/24.
//

import SwiftUI

struct AddFoodButtonGroup: View {
    @StateObject var viewModel: MainViewModel

    var body: some View {
        ZStack {
            ForEach(FoodType.allCases.indices, id: \.self) { index in
                AddFoodButton(type: FoodType.allCases[index]) {
                    viewModel.bindAction(.addLunchRecord(FoodType.allCases[index]))
                } longPressAction: {
                    viewModel.bindAction(.resetLunchRecord(FoodType.allCases[index]))
                }
                    .offset(
                        x: viewModel.getButtonPositions(index: index)?.xOffSet ?? 0,
                        y: viewModel.getButtonPositions(index: index)?.yOffSet ?? 0
                    )
            }
        }
    }
}
