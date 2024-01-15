//
//  MenuItemView.swift
//  CountApp_Elly
//
//  Created by elly on 1/13/24.
//

import SwiftUI
import ComposableArchitecture

struct MenuItemView: View {
    @ObservedObject var viewStore: ViewStore<CounterAppStore.State, CounterAppStore.Action>
    var index: Int
    private var menu: any CoffeeMenu {
        return viewStore.listOfMenu[index]
    }
    
    var body: some View {
        ZStack {
            Color(hex: menu.backgroundColor())
            Image(menu.icon())
                .cornerRadius(25)
            HStack {
                Spacer()
                if viewStore.isShowMenuCounting && viewStore.indexOfTapped == index {
                    Text("+\(menu.tapCount)")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(Color(hex: 0x283618))
                        .onAppear(perform: {
                            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
                                viewStore.send(.hideMenuCounting)
                            }
                        })
                }
            }
            .padding(.trailing, 20)
        }
    }
}
