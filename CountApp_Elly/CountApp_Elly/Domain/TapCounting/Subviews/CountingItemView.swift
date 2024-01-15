//
//  CountingItemView.swift
//  CountApp_Elly
//
//  Created by elly on 1/13/24.
//

import SwiftUI
import ComposableArchitecture

struct CountingItemView: View {
    @ObservedObject var viewStore: ViewStore<CounterAppStore.State, CounterAppStore.Action>
    var index: Int
    private var menu: any CoffeeMenu {
        return viewStore.listOfMenu[index]
    }
    
    var body: some View {
        ZStack {
            Color(hex: menu.backgroundColor())
            Text(menu.title())
            HStack {
                Spacer()
                Text(String(format: String(localized: "%dpoint"), menu.tapCount))
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(Color(hex: 0x283618))
                
            }
            .padding(.trailing, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(height: 60)
    }
}
