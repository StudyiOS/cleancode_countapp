//
//  CountApp_EllyApp.swift
//  CountApp_Elly
//
//  Created by elly on 1/13/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct CountApp_EllyApp: App {
    var body: some Scene {
        WindowGroup {
            CounterAppView(store: Store(initialState: CounterAppStore.State(), reducer: { CounterAppStore() }))
        }
    }
}
