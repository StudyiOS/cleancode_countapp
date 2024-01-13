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
                                print("Change country setting")
                            } label: {
                                Label("Choose Country", systemImage: "globe")
                            }

                            Button {
                                print("Enable geolocation")
                            } label: {
                                Label("Detect Location", systemImage: "location.circle")
                            }
                        }
                }
            }
            .navigationTitle("커피메뉴 카운팅")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//#Preview {
//    CoffeeMenuView()
//}
