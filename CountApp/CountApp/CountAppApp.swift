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
            VitaminView(
                store: Store(initialState: Vitamins.State()) {
                    Vitamins()._printChanges()
                })
        }
    }
}
