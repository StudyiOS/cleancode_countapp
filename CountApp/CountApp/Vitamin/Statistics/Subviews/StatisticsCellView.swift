//
//  StatisticsCellView.swift
//  CountApp
//
//  Created by Leo on 1/14/24.
//

import SwiftUI
import ComposableArchitecture

struct StatisticsCellView: View {

    let store: StoreOf<Vitamin>

    @State var isShowCount: Bool = false

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            HStack {
                vitaminName(with: viewStore.name)
                vitamineCount(count: viewStore.count.toString)
            }
            .vitaminCell(color: viewStore.color, height: 50)
        }
        .padding(.horizontal, 40)
    }
}

private extension StatisticsCellView {

    func vitaminName(with name: String) -> some View {
        Text(name)
            .font(.subheadline)
    }

    func vitamineCount(count: String) -> some View {
        Text(count + " 번")
    }
}

#Preview {
    StatisticsCellView(store: Store(
        initialState: Vitamin.State(
            id: UUID(),
            name: "VitaminC",
            color: Color.yellow.opacity(0.5)
        ),
        reducer: {

        }
    ))
}
