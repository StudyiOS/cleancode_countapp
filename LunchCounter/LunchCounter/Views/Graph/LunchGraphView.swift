//
//  LunchGraphView.swift
//  LunchCounter
//
//  Created by Sam Sung on 1/14/24.
//

import SwiftUI
import Charts

struct LunchGraphView: View {
    @StateObject private var viewModel: GraphViewModel
    
    init(dataManager: DataManager) {
        self._viewModel = StateObject(wrappedValue: GraphViewModel(dataManager: dataManager))
    }
    
    var body: some View {
        if viewModel.records.isEmpty {
            VStack {
                Spacer()
                
                Text("식사 데이터가 없습니다.\n\n")
                    .font(.title3)
                    .bold()
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            .onAppear(perform: {
                viewModel.bindAction(.getData)
            })
        }
        else {
            Chart(FoodType.allCases, id: \.self) { foodType in
                BarMark(
                    x: .value("FoodType", foodType),
                    y: .value("Count", viewModel.getRecordCount(with: foodType)),
                    width: 30
                )
                .foregroundStyle(by: .value("FoodType", foodType))
            }
            .chartForegroundStyleScale([
                FoodType.korean.rawValue: FoodType.korean.themeColor,
                FoodType.western.rawValue: FoodType.western.themeColor,
                FoodType.japanese.rawValue: FoodType.japanese.themeColor,
                FoodType.chinese.rawValue: FoodType.chinese.themeColor,
                FoodType.asian.rawValue: FoodType.asian.themeColor
            ])
            .padding()
            .onAppear(perform: {
                viewModel.bindAction(.getData)
            })
        }
    }
}

#Preview {
    LunchGraphView(dataManager: DataManager.shared)
}
