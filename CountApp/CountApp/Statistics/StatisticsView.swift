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
            VStack(spacing: 20) {
                ForEachStore(store.scope(state: \.vitamins,
                                         action: \.vitamins)) { store in
                    StatisticsCellView(store: store)
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
