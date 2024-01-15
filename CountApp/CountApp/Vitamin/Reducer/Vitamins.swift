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
        var vitamins: IdentifiedArrayOf<Vitamin.State> = []
    }

    enum Action {
        case vitamins(IdentifiedActionOf<Vitamin>)
        case resetAllVitamins
        case resetVitamins(name: String)
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
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
        .forEach(\.vitamins, action: \.vitamins) {
            Vitamin()
        }
    }
}

extension IdentifiedArray where ID == Vitamin.State.ID, Element == Vitamin.State {
    static let mocks: Self = [
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
