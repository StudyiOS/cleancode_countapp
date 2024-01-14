//
//  MainView.swift
//  LunchCounter
//
//  Created by Sam Sung on 1/13/24.
//

import Combine
import SwiftUI
import SwiftData

struct MainView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var record: [LunchRecord]
    
    @StateObject private var viewModel: MainViewModel
    
    init(dataManager: DataManager) {
        self._viewModel = StateObject(wrappedValue: MainViewModel(dataManager: dataManager))
    }
    
    var body: some View {
        VStack {
            Text("오늘 점심 메뉴를 골라주세요.")
                .bold()
                .font(.headline)
                .padding(.top, 30)
            
            Spacer()
            
            AddFoodButtonGroup(viewModel: viewModel)
            
            Spacer()
        }
        .toastView(toast: $viewModel.toast)
    }
}

#Preview {
    MainView(dataManager: DataManager.shared)
}
