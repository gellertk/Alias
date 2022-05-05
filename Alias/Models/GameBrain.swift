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
             cards: ["1.1", "1.2"]),
    
    Category(title: "Наука",
             image: "science",
             cards: ["2.1", "2.2"]),
    
    Category(title: "Новогодний",
             image: "christmas",
             cards: ["3.1", "3.2"]),
    
    Category(title: "Растения",
             image: "plants",
             cards: ["4.1", "4.2"]),
    
    Category(title: "Вселенная Толкиена",
             image: "tolkien",
             cards: ["5.1", "5.2"]),
    
    Category(title: "Литературные герои",
             image: "literatureheroes",
             cards: ["6.1", "6.2"]),
    
    Category(title: "18+",
             image: "18+",
             cards: ["7.1", "7.2"]),
    
    Category(title: "Хайп",
             image: "hype",
             cards: ["8.1", "8.2"]),
    
    Category(title: "Знаменитые личности",
             image: "famous",
             cards: ["9.1", "9.2"]),
    
    Category(title: "Вселенная Marvel",
             image: "marvel",
             cards: ["10.1", "10.2"]),
    
    Category(title: "Вселенная DC",
             image: "dc",
             cards: ["11.1", "11.2"]),
]

var game = GameBrain()

protocol GameBrainDelegate {
    func didScoreChanged(currentScore: Int)
    func didCardChanged(currentCard: String)
    func gameOver()
}

struct GameBrain {
    var delegate: GameBrainDelegate?
    private var isLastCard = false
    
     func getCategories() -> [Category] {
        return categoriesList
    }
    
    // TODO: DELETE так как переходит на делегат
    func getNextCard() -> String? {
        return categoriesList[0].cards[0]
    }
    
    mutating func startGame() {
        self.isLastCard = false
    }
    
    mutating func lastCard() {
        self.isLastCard = true
    }
    
    func correctCard(card: String) {
        self.cardIsShowed(card: card, isSolved: true)
    }
    
    func skipCard(card: String) {
        self.cardIsShowed(card: card, isSolved: false)
    }
    
    private func cardIsShowed(card: String, isSolved: Bool) {
        if isSolved {
            // очки +1
        } else {
            // очки -1
        }
        
        // TODO: создать модель Card и записать её в показанные карточки
        
        self.delegate?.didScoreChanged(currentScore: 0)
        
        if self.isLastCard {
            self.delegate?.gameOver()
        } else {
            self.delegate?.didCardChanged(currentCard: "")
        }
    }
}
