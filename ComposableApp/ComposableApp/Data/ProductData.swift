//
//  FruitData.swift
//  ComposableApp
//
//  Created by İrem TOSUN on 10.04.2026.
//

struct Fruit: Equatable, Identifiable, Hashable {
    let id: String
    let name: String
    let icon: String

    init(name: String, icon: String) {
        self.id = name
        self.name = name
        self.icon = icon
    }
}

enum ProductData {
    static let fruits: [Fruit] = [
        Fruit(name: "Apple", icon: "🍎"),
        Fruit(name: "Apricot", icon: "🍑"),
        Fruit(name: "Avocado", icon: "🥑"),
        Fruit(name: "Banana", icon: "🍌"),
        Fruit(name: "Blackberry", icon: "🫐"),
        Fruit(name: "Blueberry", icon: "🫐"),
        Fruit(name: "Boysenberry", icon: "🫐"),
        Fruit(name: "Cantaloupe", icon: "🍈"),
        Fruit(name: "Cherry", icon: "🍒"),
        Fruit(name: "Clementine", icon: "🍊"),
        Fruit(name: "Coconut", icon: "🥥"),
        Fruit(name: "Cranberry", icon: "🫐"),
        Fruit(name: "Currant", icon: "🫐"),
        Fruit(name: "Date", icon: "🌴"),
        Fruit(name: "Dragon Fruit", icon: "🐉"),
        Fruit(name: "Durian", icon: "🍈"),
        Fruit(name: "Elderberry", icon: "🫐"),
        Fruit(name: "Fig", icon: "🟣"),
        Fruit(name: "Gooseberry", icon: "🫐"),
        Fruit(name: "Grape", icon: "🍇"),
        Fruit(name: "Grapefruit", icon: "🍊"),
        Fruit(name: "Guava", icon: "🍐"),
        Fruit(name: "Honeydew", icon: "🍈"),
        Fruit(name: "Jackfruit", icon: "🍈"),
        Fruit(name: "Kiwi", icon: "🥝"),
        Fruit(name: "Kumquat", icon: "🍊"),
        Fruit(name: "Lemon", icon: "🍋"),
        Fruit(name: "Lime", icon: "🍋"),
        Fruit(name: "Lychee", icon: "🟠"),
        Fruit(name: "Mango", icon: "🥭"),
        Fruit(name: "Mulberry", icon: "🫐"),
        Fruit(name: "Nectarine", icon: "🍑"),
        Fruit(name: "Orange", icon: "🍊"),
        Fruit(name: "Papaya", icon: "🥭"),
        Fruit(name: "Passion Fruit", icon: "🟣"),
        Fruit(name: "Peach", icon: "🍑"),
        Fruit(name: "Pear", icon: "🍐"),
        Fruit(name: "Persimmon", icon: "🟠"),
        Fruit(name: "Pineapple", icon: "🍍"),
        Fruit(name: "Plum", icon: "🟣"),
        Fruit(name: "Pomegranate", icon: "🔴"),
        Fruit(name: "Pomelo", icon: "🍊"),
        Fruit(name: "Quince", icon: "🍐"),
        Fruit(name: "Raspberry", icon: "🍓"),
        Fruit(name: "Redcurrant", icon: "🔴"),
        Fruit(name: "Star Fruit", icon: "⭐"),
        Fruit(name: "Strawberry", icon: "🍓"),
        Fruit(name: "Tangerine", icon: "🍊"),
        Fruit(name: "Ugli Fruit", icon: "🍊"),
        Fruit(name: "Watermelon", icon: "🍉")
    ]
}
