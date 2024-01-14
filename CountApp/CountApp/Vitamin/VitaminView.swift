//
//  VitaminView.swift
//  CountApp
//
//  Created by Leo on 1/13/24.
//

import SwiftUI
import ComposableArchitecture


struct VitaminView: View {

    let store: StoreOf<Vitamins>

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack(spacing: 30) {
                ForEachStore(store.scope(state: \.vitamins,
                                         action: \.vitamins)) { store in
                        VitaminCellView(store: store)
                    }
            }
        }
    }
}

//#Preview {
//    VitaminView(
//        store: Store(initialState: Vitamin.State(), reducer: <#T##() -> Reducer#>))
//}
