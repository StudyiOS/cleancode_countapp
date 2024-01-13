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
            .navigationTitle("탭 횟수")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
