//
//  CoffeeMenuView.swift
//  CountApp_Elly
//
//  Created by elly on 1/13/24.
//

import SwiftUI
import ComposableArchitecture

struct CoffeeMenuView: View {
    @ObservedObject var viewStore: ViewStore<CounterAppStore.State, CounterAppStore.Action>
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(viewStore.listOfMenu.indices, id: \.self) { index in
                    MenuItemView(viewStore: viewStore, index: index)
                        .frame(maxWidth: .infinity)
                        .onTapGesture {
                            viewStore.send(.menuTapped(index, 1))
                        }
                        .contextMenu {
                            Button {
                                viewStore.send(.removeAllMenuCounting)
                            } label: {
                                Text(String(localized: "text_all_reset"))
                            }

                            Button {
                                viewStore.send(.menuTapped(index, 1))
                            } label: {
                                Text("+1")
                            }
                            
                            Button {
                                viewStore.send(.menuTapped(index, 5))
                            } label: {
                                Text("+5")
                            }
                            
                            Button {
                                viewStore.send(.menuTapped(index, 10))
                            } label: {
                                Text("+10")
                            }
                        }
                }
            }
            .navigationTitle(String(localized: "title_coffee_menu_counting"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//#Preview {
//    CoffeeMenuView()
//}
