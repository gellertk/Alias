//
//  Constant.swift
//  Alias
//
//  Created by Кирилл  Геллерт on 02.05.2022.
//

import UIKit

struct K {
    
    struct Color {
        static let primaryInterfaceBackground: UIColor = .init(red: 10, green: 161, blue: 221)
        static let secondaryInterfaceBackground: UIColor = .init(red: 255, green: 140, blue: 50)
        static let cardBackground: UIColor = .init(red: 239, green: 239, blue: 239)
    }
    
    struct Numeric {
        static let defaultCornerRadius: CGFloat = 10
        static let categoriesItemsPerRow: CGFloat = 2

    }
    
    struct EdgeInset {
        static let categoriesSectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
}
