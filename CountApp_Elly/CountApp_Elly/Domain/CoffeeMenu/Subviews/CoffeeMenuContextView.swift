//
//  CoffeeMenuContextView.swift
//  CountApp_Elly
//
//  Created by elly on 1/13/24.
//

import SwiftUI
import ComposableArchitecture

struct CoffeeMenuContextView: View {
    @ObservedObject var viewStore: ViewStore<CounterAppStore.State, CounterAppStore.Action>
    var index: Int
    
    var body: some View {
        Button {
            viewStore.send(.removeAllMenuCounting)
        } label: {
            Text(String(localized: "text_all_reset"))
        }

        Button {
            viewStore.send(.menuTapped(index, 1))
        } label: {
            Text("+1")
        }
        
        Button {
            viewStore.send(.menuTapped(index, 5))
        } label: {
            Text("+5")
        }
        
        Button {
            viewStore.send(.menuTapped(index, 10))
        } label: {
            Text("+10")
        }
    }
}
