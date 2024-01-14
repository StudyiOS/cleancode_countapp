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
            .vitaminCell(color: viewStore.color)
            .onTapGesture {
                viewStore.send(.tapped(viewStore.id))
            }
        }
    }
}

#Preview {
    VitaminCellView(store: Store(
        initialState: Vitamin.State(
            id: UUID(),
            name: "VitaminC",
            color: Color.yellow.opacity(0.5)
        ),
        reducer: {

        }
    ))
}

// MARK: ViewModifier
struct VitaminCell: ViewModifier {
    let color: Color
    func body(content: Content) -> some View {
        content
            .contentShape(Rectangle())
            .frame(maxWidth: .infinity, maxHeight: 100)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .padding(.horizontal, 40)
    }
}

extension View {
    func vitaminCell(color: Color) -> some View {
        modifier(VitaminCell(color: color))
    }
}
