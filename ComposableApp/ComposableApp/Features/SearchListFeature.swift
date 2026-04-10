//
//  SearchListFeature.swift
//  ComposableApp
//
//  Created by İrem TOSUN on 9.04.2026.
//

import ComposableArchitecture
import SwiftUI

@Reducer
struct SearchListFeature {
    
    @ObservableState
    struct State: Equatable {
        var searchText = ""
        var items = ["banana","orange","grapes","pine apples"]
        var isLoading = false
        var errorMessage: String?
        var selectedItem: String?
        var results: [String] = []
        @Presents var route: Destination.State?
        
        init() {
            self.results = items
        }
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case searchButtonTapped
        case searchResponseFetched([String])
        case itemTapped(String)
        case route(PresentationAction<Destination.Action>)
    }
    
    @Reducer
    struct Destination {
        enum State: Equatable {
            case detail(ProductDetailFeature.State)
        }
        
        enum Action {
            case detail(ProductDetailFeature.Action)
        }
        
        var body: some Reducer<State, Action> {
            Scope(state: \.detail, action: \.detail) {
                ProductDetailFeature()
            }
        }
    }
    
    var body: some Reducer<State, Action> {
        BindingReducer()
        
        Reduce{ state, action in
            switch action {
            case .binding:
                return .none
                
            case .searchButtonTapped:
                state.isLoading = true
                state.errorMessage = nil
                let query = state.searchText.trimmingCharacters(in: .whitespacesAndNewlines)
                let items = state.items
                
                return .run { send in
                    try await Task.sleep(for: .seconds(1))
                    let filteredItems: [String]
                    
                    if query.isEmpty {
                        filteredItems = items
                    } else {
                        filteredItems = items.filter{ $0.localizedCaseInsensitiveContains(query) }
                    }
                    await send(.searchResponseFetched(filteredItems))
                }
                
            case .searchResponseFetched(let results):
                state.isLoading = false
                state.results = results
                return .none
                
            case .itemTapped(let item):
                state.selectedItem = item
                state.route = .detail(ProductDetailFeature.State(item: item))
                return .none
            case .route:
                return .none
            }
        }
        .ifLet(\.$route, action: \.route) {
            Destination()
        }
    }
}
