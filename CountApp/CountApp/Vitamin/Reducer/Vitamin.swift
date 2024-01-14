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
        case increaseCount(UUID, Int)
        case decreaseToZero(UUID)
    }

    var body: some Reducer<State, Action> {
        BindingReducer()
        Reduce { state, action in
            switch action {
                case .binding:
                    return .none
                case .increaseCount:
                    return .none
                case .decreaseToZero:
                    return .none
            }
        }
    }
}
