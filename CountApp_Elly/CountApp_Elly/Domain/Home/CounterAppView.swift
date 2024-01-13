//
//  CounterAppView.swift
//  CountApp_Elly
//
//  Created by elly on 1/13/24.
//

import SwiftUI
import ComposableArchitecture

struct CounterAppView: View {
    let store: Store<CounterAppStore.State, CounterAppStore.Action>
    @ObservedObject var viewStore: ViewStore<CounterAppStore.State, CounterAppStore.Action>
    
    public init(store: Store<CounterAppStore.State, CounterAppStore.Action>) {
        self.store = store
        viewStore = ViewStore(store, observe: { $0 })
    }
    
    var body: some View {
        TabView {
            CoffeeMenuView(viewStore: viewStore)
                .tabItem {
                  Image(systemName: "cup.and.saucer")
                  Text("커피메뉴 카운팅")
                }
            TapCountingView(viewStore: viewStore)
                .tabItem {
                  Image(systemName: "chart.bar")
                  Text("탭 횟수")
                }
            }
            .font(.headline)
    }
}
