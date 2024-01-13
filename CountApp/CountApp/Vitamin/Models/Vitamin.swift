//
//  Vitamin.swift
//  CountApp
//
//  Created by Leo on 1/13/24.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct Vitamin {
    struct State: Equatable, Identifiable {
        let id: UUID
        let name: String
        var count: Int = 0
    }

    enum Action: BindableAction, Sendable {
        case binding(BindingAction<State>)
        case tapped
    }

    var body: some Reducer<State, Action> {
        BindingReducer()
        Reduce { state, action in
            switch action {
                case .binding:
                    return .none
                case .tapped:
                    return .none
            }
        }
    }
}
