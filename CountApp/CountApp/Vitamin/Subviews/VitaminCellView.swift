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
                Image(systemName: "pills.fill")
                Text(viewStore.name)
                    .font(.subheadline)
            }
            .vitaminCell(color: viewStore.color)
            .contextMenu {
                menuItems(with: viewStore)
            }
            .onTapGesture {
                viewStore.send(.increaseCount(viewStore.id, 1))
            }
            .padding(.horizontal, 40)
        }
    }
}

private extension VitaminCellView {
    @ViewBuilder
    func menuItems(with viewStore: ViewStore<Vitamin.State, Vitamin.Action>) -> some View {
        Group {
            Button(
                role: .destructive,
                action: {
                    viewStore.send(.decreaseToZero(viewStore.state.id))
                }, label: {
                    Text("모두 초기화")
                }
            )

            Button("+1") {
                viewStore.send(.increaseCount(viewStore.state.id, 1))
            }

            Button("+5") {
                viewStore.send(.increaseCount(viewStore.state.id, 5))
            }

            Button("+10") {
                viewStore.send(.increaseCount(viewStore.state.id, 10))
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
            .frame(maxWidth: .infinity, maxHeight: 100)
            .contentShape(.contextMenuPreview, // contextmenu radius
                          RoundedRectangle(cornerRadius: 25))
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .overlay {
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 0.5)
            }
    }
}

extension View {
    func vitaminCell(color: Color) -> some View {
        modifier(VitaminCell(color: color))
    }
}
