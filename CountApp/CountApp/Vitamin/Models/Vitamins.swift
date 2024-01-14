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
                          name: "비타민 C",
                          color: Color.yellow.opacity(0.5)),
            Vitamin.State(id: UUID(),
                          name: "비타민 D",
                          color: Color.red.opacity(0.5)),
            Vitamin.State(id: UUID(),
                          name: "비타민 B",
                          color: Color.blue.opacity(0.5)),
            Vitamin.State(id: UUID(),
                          name: "루테인",
                          color: Color.pink.opacity(0.5)),
            Vitamin.State(id: UUID(),
                          name: "유산균",
                          color: Color.green.opacity(0.5)),
        ]
    }

    enum Action {
        case vitamins(IdentifiedActionOf<Vitamin>)
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
                case .vitamins(.element(id: _, action: .tapped(let id))):
                    if var selectedVitamin = state.vitamins.first(where: { $0.id == id }) {
                        selectedVitamin.count += 1
                        state.vitamins.updateOrAppend(selectedVitamin)
                    }
                    return .none
                case .vitamins:
                    return .none
            }
        }
    }

}
