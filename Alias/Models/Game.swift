//
//  GameBrain.swift
//  Alias
//
//  Created by Полина Дусин on 05.05.2022.
//

import UIKit

class Game {
    
    private struct Points {
        static let correctBonus = 1
        static let skipPenalty = 1
    }
    
    static let roundsToReset = 4
    
    private var shownCards: [String: Int] = [:]
    private var cards: [String] = []
    private var currentCard = ""
    
    private(set) var score = 0
    private(set) var round = 0 {
        didSet {
            var excludedKeys: [String] = []
            for index in shownCards.indices {
                let roundsLeft = shownCards[index].value - 1
                shownCards.updateValue(roundsLeft, forKey: shownCards[index].key)
                if roundsLeft == 0 {
                    excludedKeys.append(shownCards[index].key)
                }
            }
            for key in excludedKeys {
                shownCards.removeValue(forKey: key)
            }
        }
    }
    
    var selectedCategories: [Category] = []
    
    func getFirstCard() -> String {
        score = 0
        round += 1
        fillCards()
        
        if cards.count == 0 {
            shownCards = [:]
            fillCards()
            return cards.first ?? ""
        }
        
        return cards.first ?? ""
    }
    
    func getNextCard(currentIsSolved: Bool) -> String {
        handleScore(isSolved: currentIsSolved)
        addToShownCards()
        currentCard = cards.first ?? ""
        
        return currentCard
    }
    
    private func addToShownCards() {
        shownCards[currentCard] = Game.roundsToReset
        cards.removeAll { $0 == currentCard }
    }
    
    private func handleScore(isSolved: Bool) {
        if isSolved {
            score += Points.correctBonus
        } else {
            score -= Points.skipPenalty
        }
    }
    
    private func fillCards() {
        cards.removeAll()
        selectedCategories.forEach { category in
            cards += category.cards.filter { shownCards[$0] == nil }
        }
        cards.shuffle()
        currentCard = cards.first ?? ""
    }
    
}
