//
//  Category.swift
//  Alias
//
//  Created by Кирилл  Геллерт on 03.05.2022.
//

import Foundation

struct Category {
    
    let title: String
    let imageName: String?
    let cards: [Card]
    var isSelected: Bool
    
    init(title: String, image: String?, cards: [Card]) {
        self.title = title
        self.imageName = image
        self.cards = cards
        self.isSelected = false
    }
    
    mutating func toggleSelection() {
        isSelected.toggle()
    }
    
    static func getCategories() -> [Category] {
        return [
            Category(title: "Базовый набор",
                     image: "base",
                     cards: [Card(title: "Джемпер"), Card(title: "Окружность"), Card(title: "Кабура"), Card(title: "Пума"), Card(title: "Топот")]),
            Category(title: "Наука",
                     image: "science",
                     cards: [Card(title: "Джемпер"), Card(title: "Окружность"), Card(title: "Кабура"), Card(title: "Пума"), Card(title: "Топот")]),
            Category(title: "Новогодний",
                     image: "christmas",
                     cards: [Card(title: "Джемпер"), Card(title: "Окружность"), Card(title: "Кабура"), Card(title: "Пума"), Card(title: "Топот")]),
            Category(title: "Растения",
                     image: "plants",
                     cards: [Card(title: "Джемпер"), Card(title: "Окружность"), Card(title: "Кабура"), Card(title: "Пума"), Card(title: "Топот")]),
            Category(title: "Вселенная Толкиена",
                     image: "tolkien",
                     cards: [Card(title: "Джемпер"), Card(title: "Окружность"), Card(title: "Кабура"), Card(title: "Пума"), Card(title: "Топот")]),
            Category(title: "Литературные герои",
                     image: "literatureheroes",
                     cards: [Card(title: "Джемпер"), Card(title: "Окружность"), Card(title: "Кабура"), Card(title: "Пума"), Card(title: "Топот")]),
            Category(title: "18+",
                     image: "18+",
                     cards: [Card(title: "Джемпер"), Card(title: "Окружность"), Card(title: "Кабура"), Card(title: "Пума"), Card(title: "Топот")]),
            Category(title: "Хайп",
                     image: "hype",
                     cards: [Card(title: "Джемпер"), Card(title: "Окружность"), Card(title: "Кабура"), Card(title: "Пума"), Card(title: "Топот")]),
            Category(title: "Знаменитые личности",
                     image: "famous",
                     cards: [Card(title: "Джемпер"), Card(title: "Окружность"), Card(title: "Кабура"), Card(title: "Пума"), Card(title: "Топот")]),
            Category(title: "Вселенная Marvel",
                     image: "marvel",
                     cards: [Card(title: "Джемпер"), Card(title: "Окружность"), Card(title: "Кабура"), Card(title: "Пума"), Card(title: "Топот")]),
            Category(title: "Вселенная DC",
                     image: "dc",
                     cards: [Card(title: "Джемпер"), Card(title: "Окружность"), Card(title: "Кабура"), Card(title: "Пума"), Card(title: "Топот")])
        ]
    }
    
}
