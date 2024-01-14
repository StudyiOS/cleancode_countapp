//
//  TabViewItem.swift
//  LunchCounter
//
//  Created by Sam Sung on 1/14/24.
//

import SwiftUI

struct TabViewItem: ViewModifier {
    let index: Int
    var title: String?
    let systemImageName: String
    @Binding var selectedTab: Int
    
    func body(content: Content) -> some View {
        content
            .tabItem {
                VStack {
                    Image(systemName: systemImageName)
                        .environment(\.symbolVariants, selectedTab == index ? .fill : .none)
                    if title != nil {
                        Text(title!)
                    }
                }
            }
            .onAppear { selectedTab = index }
            .tag(index)
    }
}
