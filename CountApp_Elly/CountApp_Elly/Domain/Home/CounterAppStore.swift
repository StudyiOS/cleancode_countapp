//
//  CounterAppStore.swift
//  CountApp_Elly
//
//  Created by elly on 1/13/24.
//

import ComposableArchitecture

@Reducer
struct CounterAppStore {
    struct State: Equatable {
        var listOfMenu: [any Menu] = [
            Americano(), Latte(), CaramelMacchiato(), Mocha(), Hazelnut()
        ]
        var indexOfTapped: Int = 0
        var isShowMenuCounting: Bool = false
        static func == (lhs: CounterAppStore.State, rhs: CounterAppStore.State) -> Bool {
            return false
        }
    }
    
    enum Action {
        case menuTapped(_ index: Int, _ count: Int)
        case hideMenuCounting
        case addCount(_ count: Int)
        case setShowMenuCounting
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
                case .menuTapped(let index, let count):
                    state.indexOfTapped = index
                    return .send(.addCount(count))
                case .addCount(let count):
                    state.listOfMenu[state.indexOfTapped].addCount(count)
                    return .send(.setShowMenuCounting)
                case .setShowMenuCounting:
                    state.isShowMenuCounting = true
                    return .none
                case .hideMenuCounting:
                    state.isShowMenuCounting = false
                    return .none
            }
        }
    }
}
