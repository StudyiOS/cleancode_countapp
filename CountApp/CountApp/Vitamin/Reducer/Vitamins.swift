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
        case resetAllVitamins
        case resetVitamins(name: String)
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
                case .vitamins(.element(id: _, action: .increaseCount(let id, let count))):
                    if var selectedVitamin = state.vitamins[id: id] {
                        selectedVitamin.count += count
                        state.vitamins.updateOrAppend(selectedVitamin)
                    }
                    return .none
                case .vitamins(.element(id: _, action: .decreaseToZero(let id))):
                    if var selectedVitamin = state.vitamins[id: id] {
                        selectedVitamin.count = 0
                        state.vitamins.updateOrAppend(selectedVitamin)
                    }
                    return .none
                case .vitamins:
                    return .none
                case .resetAllVitamins:
                    state.vitamins.forEach {
                        var vitamin = $0
                        vitamin.count = 0
                        state.vitamins.updateOrAppend(vitamin)
                    }
                    return .none
                case .resetVitamins(let name):
                    if var selectedVitamin = state.vitamins.first(where: { $0.name == name }) {
                        selectedVitamin.count = 0
                        state.vitamins.updateOrAppend(selectedVitamin)
                    }
                    return .none
            }
        }
    }
}
