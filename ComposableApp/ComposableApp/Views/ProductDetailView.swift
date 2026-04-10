//
//  ProductDetailView.swift
//  ComposableApp
//
//  Created by İrem TOSUN on 9.04.2026.
//

import SwiftUI
import ComposableArchitecture

struct ProductDetailView: View {
    @Perception.Bindable var store: StoreOf<ProductDetailFeature>
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(store.item)
                .font(.headline)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Product Details")
    }
}
