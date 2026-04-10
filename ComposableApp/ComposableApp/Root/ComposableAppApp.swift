//
//  ComposableAppApp.swift
//  ComposableApp
//
//  Created by İrem TOSUN on 9.04.2026.
//

import ComposableArchitecture
import SwiftUI

@main
struct ComposableAppApp: App {
    var body: some Scene {
        WindowGroup {
            SearchListView(store: Store(initialState: SearchListFeature.State()) {
                SearchListFeature()
            })
        }
    }
}
