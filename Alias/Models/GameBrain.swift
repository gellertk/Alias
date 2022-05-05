//
//  GameBrain.swift
//  Alias
//
//  Created by Полина Дусин on 05.05.2022.
//

import UIKit

let categoriesList = [
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

struct GameBrain {
    
     func getCategories() -> [Category] {
        return categoriesList
    }
    
    func getNextCard() -> String? {
        return categoriesList[0].cards[0].title
    }
}
