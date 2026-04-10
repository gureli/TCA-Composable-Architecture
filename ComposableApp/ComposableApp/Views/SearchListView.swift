//
//  SearchListView.swift
//  ComposableApp
//
//  Created by İrem TOSUN on 9.04.2026.
//

import SwiftUI
import ComposableArchitecture

struct SearchListView: View {
    @Perception.Bindable var store: StoreOf<SearchListFeature>
    
    var body: some View {
        NavigationStack {
            WithPerceptionTracking {
                let list = store.results
                ZStack {
                    VStack(spacing: 12) {
                        HStack {
                            TextField("Search products", text:  $store.searchText)
                                .textFieldStyle(.roundedBorder)
                            
                            Button("Search") {
                                store.send(.searchButtonTapped)
                            }
                            .buttonStyle(.borderedProminent)
                        }
                        
                        listSection(for: list)
                    }
                    .navigationDestination(item: $store.scope(state: \.route?.detail,
                                                              action: \.route.detail)) { detailStore in
                        WithPerceptionTracking {
                            ProductDetailView(store: detailStore)
                        }
                    }
                    
                    if store.isLoading {
                        ProgressView("Searching...")
                    }
                }
            }
            .padding()
            .navigationTitle("Products")
        }
    }
    
    @ViewBuilder private func listSection(for list: [Fruit])-> some View {
        List {
            ForEach(list, id: \.self) { item in
                HStack {
                    Text(item.icon)
                    
                    Button(item.name) {
                        store.send(.itemTapped(item))
                    }
                    
                    Spacer()
                }
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color.clear)
    }
}
