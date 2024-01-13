//
//  TapCountingView.swift
//  CountApp_Elly
//
//  Created by elly on 1/13/24.
//

import SwiftUI
import ComposableArchitecture

struct TapCountingView: View {
    @ObservedObject var viewStore: ViewStore<CounterAppStore.State, CounterAppStore.Action>
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(viewStore.listOfMenu.indices, id: \.self) { index in
                        CountingItemView(viewStore: viewStore, index: index)
                            .padding(.all, 5)
                    }
                }
                Spacer()
            }
            .navigationTitle(String(localized: "title_tap_counting"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu(content: {
                        Button(action: {
                            viewStore.send(.removeAllMenuCounting)
                        }, label: {
                            Text("모두 초기화")
                        })
                        
                        Button(action: {
                            viewStore.send(.removeMenuCounting(0))
                        }, label: {
                            Text("아메리카노 초기화")
                        })
                        
                        Button(action: {
                            viewStore.send(.removeMenuCounting(1))
                        }, label: {
                            Text("카페 라떼 초기화")
                        })
                        
                        Button(action: {
                            viewStore.send(.removeMenuCounting(2))
                        }, label: {
                            Text("카라멜 마끼아또 초기화")
                        })
                        
                        Button(action: {
                            viewStore.send(.removeMenuCounting(3))
                        }, label: {
                            Text("카페 모카 초기화")
                        })
                        
                        Button(action: {
                            viewStore.send(.removeMenuCounting(4))
                        }, label: {
                            Text("헤이즐넛 라떼 초기화")
                        })
                    }, label: {
                        Image(systemName: "gearshape")
                    })
                }
            }
        }
    }
}
