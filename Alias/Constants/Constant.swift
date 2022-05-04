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
        static let correctButtonColor: UIColor = .init(red: 91, green: 146, blue: 89)
        static let skipButtonColor: UIColor = .init(red: 179, green: 48, blue: 48)
        static let secondaryButtonColor: UIColor = .init(red: 21, green: 114, blue: 161)        
    }
    
    struct Numeric {
        static let defaultCornerRadius: CGFloat = 10
        static let categoriesItemsPerRow: CGFloat = 2

    }
    
    struct EdgeInset {
        static let categoriesSectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
}
