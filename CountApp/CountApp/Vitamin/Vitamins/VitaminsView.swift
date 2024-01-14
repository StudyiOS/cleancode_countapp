//
//  VitaminsView.swift
//  CountApp
//
//  Created by Leo on 1/13/24.
//

import SwiftUI
import ComposableArchitecture

struct VitaminsView: View {

    let store: StoreOf<Vitamins>

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            NavigationView {
                VStack(spacing: 20) {
                    ForEachStore(store.scope(state: \.vitamins,
                                             action: \.vitamins)) { store in
                        VitaminCellView(store: store)
                    }
                }
                .navigationTitle("비타민을 먹으세요")
                .navigationBarTitleDisplayMode(.automatic)
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.vertical)
            }
        }
    }
}

#Preview {
    VitaminsView(
        store: Store(initialState: Vitamins.State()){

        })
}
