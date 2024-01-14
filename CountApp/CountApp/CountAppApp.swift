//
//  CountAppApp.swift
//  CountApp
//
//  Created by Leo on 1/13/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct CountAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: Store(initialState: Vitamins.State()) {
                Vitamins()._printChanges()
            })
        }
    }
}

struct ContentView: View {
    let store: StoreOf<Vitamins>

    var body: some View {
        TabView {
            VitaminsView(store: store)
            .tabItem {
                Image(systemName: "pills.fill")
                Text("비타민")
            }

            StatisticsView(store: store)
            .tabItem {
                Image(systemName: "chart.bar.doc.horizontal")
                Text("먹은 횟수")
            }
        }
    }
}
