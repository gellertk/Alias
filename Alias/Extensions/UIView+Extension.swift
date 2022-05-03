//
//  UICollectionViewCell+Extension.swift
//  Alias
//
//  Created by Кирилл  Геллерт on 03.05.2022.
//

import UIKit

extension UIView {
    
    func shrink(direction: ShrinkDirection) {
        UIView.animate(withDuration: 0.1, delay: 0.0, options: [.allowUserInteraction]) {
            self.transform = direction == ShrinkDirection.down ? CGAffineTransform(scaleX: 0.95, y: 0.95) : .identity
        }
    }
    
    func addShadow() {
        layer.shadowOpacity = 1
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = backgroundColor?.cgColor
    }
    
}


