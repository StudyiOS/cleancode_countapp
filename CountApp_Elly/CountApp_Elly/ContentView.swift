//
//  ContentView.swift
//  CountApp_Elly
//
//  Created by elly on 1/13/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
              Text("커피메뉴 카운팅")
                .tabItem {
                  Image(systemName: "cup.and.saucer")
                  Text("커피메뉴 카운팅")
                }
              Text("탭 횟수")
                .tabItem {
                  Image(systemName: "chart.bar")
                  Text("탭 횟수")
                }
            }
            .font(.headline)
    }
}

#Preview {
    ContentView()
}
