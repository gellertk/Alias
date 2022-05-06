//
//  Enumerations.swift
//  Alias
//
//  Created by Кирилл  Геллерт on 03.05.2022.
//

import Foundation

enum ShrinkDirection {
    case up
    case down
}

enum CommonButtonType: String {
    case newGame = "Начать новый раунд"
    case continueGame = "Продолжить"
    case skipCard = ">>"
    case correctCard = "✔︎"
    case resetGame = "Сброс"
}
