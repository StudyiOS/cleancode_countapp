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
        let color: Color
        @BindingState var count: Int = 0
    }

    enum Action: BindableAction, Sendable {
        case binding(BindingAction<State>)
        case increaseCount(Int)
        case decreaseToZero
    }

    var body: some Reducer<State, Action> {
        BindingReducer()
        Reduce { state, action in
            switch action {
                case .binding:
                    return .none
                case .increaseCount(let count):
                    state.count += count
                    return .none
                case .decreaseToZero:
                    state.count  = 0
                    return .none
            }
        }
    }
}
