//
//  TapCountingContextView.swift
//  CountApp_Elly
//
//  Created by elly on 1/13/24.
//

import SwiftUI
import ComposableArchitecture

struct TapCountingContextView: View {
    @ObservedObject var viewStore: ViewStore<CounterAppStore.State, CounterAppStore.Action>
    
    var body: some View {
        Button(action: {
            viewStore.send(.removeAllMenuCounting)
        }, label: {
            Text(String(localized: "text_all_reset"))
        })
        
        Button(action: {
            viewStore.send(.removeMenuCounting(0))
        }, label: {
            Text(String(localized: "text_reset_americano"))
        })
        
        Button(action: {
            viewStore.send(.removeMenuCounting(1))
        }, label: {
            Text(String(localized: "text_reset_latte"))
        })
        
        Button(action: {
            viewStore.send(.removeMenuCounting(2))
        }, label: {
            Text(String(localized: "text_reset_caramel_macchiato"))
        })
        
        Button(action: {
            viewStore.send(.removeMenuCounting(3))
        }, label: {
            Text(String(localized: "text_reset_mocha"))
        })
        
        Button(action: {
            viewStore.send(.removeMenuCounting(4))
        }, label: {
            Text(String(localized: "text_reset_hazelnut"))
        })
    }
}
