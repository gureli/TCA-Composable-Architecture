//
//  SearchListFeatureTests.swift
//  ComposableAppTests
//
//  Created by Codex on 10.04.2026.
//

import ComposableArchitecture
import Testing
@testable import ComposableApp
internal import Foundation

struct SearchListFeatureTests {

    @Test
    func initialStateShowsAllProducts() {
        let state = SearchListFeature.State()

        #expect(state.results == ProductData.fruits)
        #expect(state.isLoading == false)
        #expect(state.selectedItem == nil)
    }

    @Test
    @MainActor
    func searchButtonFiltersMatchingProducts() async {
        let store = TestStore(initialState: SearchListFeature.State()) {
            SearchListFeature()
        }
        let expectedResults: [Fruit] = ProductData.fruits.filter {
            $0.name.localizedCaseInsensitiveContains("ap")
        }

        await store.send(.binding(.set(\.searchText, "ap"))) {
            $0.searchText = "ap"
        }
        await store.send(.searchButtonTapped) {
            $0.isLoading = true
            $0.errorMessage = nil
        }
        await store.receive(\.searchResponseFetched) {
            $0.isLoading = false
            $0.results = expectedResults
        }
    }

    @Test
    @MainActor
    func searchButtonWithEmptyQueryReturnsAllProducts() async {
        let store = TestStore(initialState: SearchListFeature.State()) {
            SearchListFeature()
        }

        await store.send(.searchButtonTapped) {
            $0.isLoading = true
            $0.errorMessage = nil
        }
        await store.receive(\.searchResponseFetched) {
            $0.isLoading = false
            $0.results = ProductData.fruits
        }
    }

    @Test
    @MainActor
    func itemTappedSetsSelectionAndRoute() async {
        let selectedFruit = ProductData.fruits[0]
        let store = TestStore(initialState: SearchListFeature.State()) {
            SearchListFeature()
        }

        await store.send(.itemTapped(selectedFruit)) {
            $0.selectedItem = selectedFruit
            $0.route = .detail(ProductDetailFeature.State(item: selectedFruit))
        }
    }
}
