//
//  VitaminCellView.swift
//  CountApp
//
//  Created by Leo on 1/14/24.
//

import SwiftUI
import ComposableArchitecture

struct VitaminCellView: View {
    let store: StoreOf<Vitamin>
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            HStack {
                Text(viewStore.name)
            }
            .frame(maxWidth: .infinity, maxHeight: 100)
        }
    }
}
