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
    func gameOver(currentScore: Int)
}

struct GameBrain {
    var delegate: GameBrainDelegate?
    private var isLastCard = false
    private var currentScore = 0
    private var showedCards: [String : Bool] = [:]
    private var selectedCategories: [Category] = []
    private var currentRound = 0
    
    func getCategories() -> [Category] {
        return categoriesList
    }
    
    mutating func setSelectedCategories(selectedCategories: [Category]) {
        self.selectedCategories = selectedCategories
    }
    
    mutating func startGame() {
        self.isLastCard = false
        self.currentScore = 0
        
        // Через 4 раунда словарь с показанными карточками очищается
        if currentRound >= 4 {
            resetGame()
        }
        
        self.currentRound += 1
        
        updateStates()
    }
    
    mutating func resetGame() {
        self.showedCards = [:]
        self.currentRound = 0
    }
    
    mutating func lastCard() {
        self.isLastCard = true
    }
    
    mutating func correctCard(card: String) {
        self.cardIsShowed(card: card, isSolved: true)
    }
    
    mutating func skipCard(card: String) {
        self.cardIsShowed(card: card, isSolved: false)
    }
    
    private mutating func cardIsShowed(card: String, isSolved: Bool) {
        if isSolved {
            self.currentScore += 1
        } else {
            self.currentScore -= 1
        }
        
        self.showedCards[card] = true
        
        updateStates()
    }
    
    private func updateStates() {
        self.delegate?.didScoreChanged(currentScore: self.currentScore)
        
        if self.isLastCard {
            self.delegate?.gameOver(currentScore: self.currentScore)
            return
        }
        
        var nextCard = ""
        
        // N попыток достать случайную карту, с проверкой, что случайной карты не было ранее
        // После N попвток будет показана последняя случайная карта
        for _ in 0...10 {
            let possebleNextCard = selectedCategories.randomElement()?.cards.randomElement()
            nextCard = possebleNextCard ?? ""
            
            // Если значения нет, то это уникальная карточка
            if self.showedCards[nextCard] == nil {
                break
            }
        }
        
        self.delegate?.didCardChanged(currentCard: nextCard)
    }
}
