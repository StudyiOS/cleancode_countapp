//
//  VitaminCellView.swift
//  CountApp
//
//  Created by Leo on 1/14/24.
//

import SwiftUI
import ComposableArchitecture
import Combine

struct VitaminCellView: View {

    let store: StoreOf<Vitamin>

    @State var isShowingCount: Bool = false {
        didSet {
            if isShowingCount {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation {
                        isShowingCount = false
                    }
                }
            }
        }
    }

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            HStack {
                pillImage
                vitaminName(with: viewStore.name)
            }
            .vitaminCellFrame(color: viewStore.color)
            .overlay(alignment: .trailing) {
                vitamineCount(count: viewStore.count.toString)
                    .opacity(isShowingCount ? 1 : 0)
                    .padding(.trailing, 60)
            }
            .onChange(of: viewStore.count) {
                withAnimation {
                    isShowingCount = true
                }
            }
            .contextMenu {
                menuItems(with: viewStore)
            }
            .onTapGesture {
                viewStore.send(.increaseCount(viewStore.id, 1))
            }
        }
        .padding(.horizontal, 40)
    }
}

private extension VitaminCellView {
    typealias VitaminStore = ViewStore<Vitamin.State, Vitamin.Action>

    var pillImage: Image {
        Image(systemName: "pills.fill")
    }

    func vitaminName(with name: String) -> some View {
        Text(name)
            .font(.subheadline)
    }

    func vitamineCount(count: String) -> some View {
        Text("+ " + count)
    }

    func menuItems(with viewStore: VitaminStore) -> some View {
        let increaseSteps = [1, 5, 10]
        return Group {
            resetAllButton(with: viewStore)

            ForEach(0..<increaseSteps.count, id: \.self) {
                increaseButton(with: viewStore, step: increaseSteps[$0])
            }
        }
    }

    func resetAllButton(with viewStore: VitaminStore) -> Button<Text> {
        Button(
            role: .destructive,
            action: {
                viewStore.send(.decreaseToZero(viewStore.state.id))
            }, label: {
                Text("모두 초기화")
            }
        )
    }

    func increaseButton(with viewStore: VitaminStore, step: Int) -> Button<Text> {
        Button("+" + step.toString) {
            viewStore.send(.increaseCount(viewStore.state.id, step))
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
