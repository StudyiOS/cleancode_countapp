//
//  MainView.swift
//  LunchCounter
//
//  Created by Sam Sung on 1/13/24.
//

import SwiftUI
import Combine

struct MainView: View {
    @ObservedObject var viewModel = MainViewModel()
    
    var body: some View {
        VStack {
            Text("오늘 점심 메뉴를 골라주세요.")
                .bold()
                .font(.headline)
                .padding(.top)
            Spacer()
            AddFoodButtonGroup(viewModel: viewModel)
            Spacer()
        }
    }
}

#Preview {
    MainView()
}
