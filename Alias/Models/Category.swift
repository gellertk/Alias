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
    let cards: [String]
    var isSelected: Bool
    
    init(title: String, image: String?, cards: [String]) {
        self.title = title
        self.imageName = image
        self.cards = cards
        self.isSelected = false
    }
    
    mutating func toggleSelection() {
        isSelected.toggle()
    }
}
