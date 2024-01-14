//
//  TabView.swift
//  LunchCounter
//
//  Created by Sam Sung on 1/14/24.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MainView(dataManager: DataManager.shared)
                .modifier(TabViewItem(index: 0,
                                      title: "Food",
                                      systemImageName: "fork.knife",
                                      selectedTab: $selectedTab))
            
            LunchGraphView(dataManager: DataManager.shared)
                .modifier(TabViewItem(index: 1, 
                                      title: "Chart",
                                      systemImageName: "chart.bar.xaxis",
                                      selectedTab: $selectedTab))
        }
        .tint(.black)
    }
}

#Preview {
    MainTabView()
}
