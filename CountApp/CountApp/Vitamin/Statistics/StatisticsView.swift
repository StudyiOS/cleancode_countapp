//
//  StatisticsView.swift
//  CountApp
//
//  Created by Leo on 1/14/24.
//

import SwiftUI
import ComposableArchitecture

struct StatisticsView: View {

    let store: StoreOf<Vitamins>

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            NavigationView {
                VStack(spacing: 20) {
                    ForEachStore(store.scope(state: \.vitamins,
                                             action: \.vitamins)) { store in
                        StatisticsCellView(store: store)
                    }
                }
                .navigationTitle("먹은 횟수")
                .navigationBarTitleDisplayMode(.automatic)
                .toolbar {
                    Menu {
                        menuItems(with: viewStore)
                    } label: {
                        Image(systemName: "ellipsis.circle")
                    }
                }
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.vertical)
            }
        }
    }
}

private extension StatisticsView {
    func menuItems(with viewStore: ViewStore<Vitamins.State, Vitamins.Action>) -> some View {
        Group {
            Button(
                role: .destructive,
                action: {
                    viewStore.send(.resetAllVitamins)
                }, label: {
                    Text("모두 초기화")
                }
            )

            ForEach(viewStore.state.vitamins) {
                let name = $0.name
                Button("\(name) 초기화") {
                    viewStore.send(.resetVitamins(name: name))
                }
            }
        }
    }
}

#Preview {
    StatisticsView(
        store: Store(initialState: Vitamins.State()){

        })
}
