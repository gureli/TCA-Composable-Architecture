//
//  ProductDetailFeature.swift
//  ComposableApp
//
//  Created by İrem TOSUN on 9.04.2026.
//

import ComposableArchitecture
import SwiftUI

@Reducer
struct ProductDetailFeature {
    
    @ObservableState
    struct State: Equatable {
        var item: Fruit
    }
    
    enum Action {
       // No actions right now
    }
    
    var body: some Reducer<State, Action> {
       
        Reduce { state, action in
            .none
        }
    }
}
