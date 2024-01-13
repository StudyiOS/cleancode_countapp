//
//  Vitamins.swift
//  CountApp
//
//  Created by Leo on 1/14/24.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct Vitamins {
    struct State: Equatable {
        var vitamins: IdentifiedArrayOf<Vitamin.State> = [
            Vitamin.State(id: UUID(),
                          name: "Vitamin C"),
            Vitamin.State(id: UUID(),
                          name: "Vitamin B"),
            Vitamin.State(id: UUID(),
                          name: "Vitamin D")
        ]
    }

    enum Action {
        case vitamins(IdentifiedActionOf<Vitamin>)

    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
                case .vitamins(.element(id: _, action: .tapped)):
                    print("tapped")
                    return .none
                case .vitamins:
                    return .none
            }
        }
    }
}
