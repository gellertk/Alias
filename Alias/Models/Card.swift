//
//  Card.swift
//  Alias
//
//  Created by Кирилл  Геллерт on 03.05.2022.
//

import Foundation

struct Card {
    let title: String
    var isSolved: Bool
    
    init(title: String) {
        self.title = title
        self.isSolved = false
    }
}
