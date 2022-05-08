//
//  Enumerations.swift
//  Alias
//
//  Created by Кирилл  Геллерт on 03.05.2022.
//

import UIKit

enum ShrinkDirection {
    case up
    case down
}

enum CommonButtonType: String {
    
    case newGame = "Новая игра"
    case rules = "Правила"
    case continueGame = "Продолжить"
    case resetGame = "Меню"
    case skipCard
    case correctCard
    
    var backgroundColor: UIColor {
        switch self {
        case .newGame, .continueGame, .rules:
            return K.Color.secondaryInterfaceBackground
        case .skipCard:
            return K.Color.skipButton
        case .correctCard:
            return K.Color.correctButton
        case .resetGame:
            return .clear
        }
    }
    
    var imageName: String? {
        switch self {
        case .resetGame:
            return "arrow.counterclockwise"
        case .skipCard:
            return "multiply"
        case .correctCard:
            return "checkmark"
        default:
            return nil
        }
    }
    
}
