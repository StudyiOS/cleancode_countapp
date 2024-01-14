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

            Button("비타민 C 초기화") {
                viewStore.send(.resetVitamins(name: "비타민 C"))
            }

            Button("비타민 D 초기화") {
                viewStore.send(.resetVitamins(name: "비타민 C"))
            }

            Button("비타민 B 초기화") {
                viewStore.send(.resetVitamins(name: "비타민 C"))
            }

            Button("루테인 초기화") {
                viewStore.send(.resetVitamins(name: "루테인"))
            }

            Button("유산균 초기화") {
                viewStore.send(.resetVitamins(name: "유산균"))
            }
        }
    }

}

#Preview {
    StatisticsView(
        store: Store(initialState: Vitamins.State()){

        })
}
