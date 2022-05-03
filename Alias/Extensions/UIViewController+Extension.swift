//
//  UIViewController+Extension.swift
//  Alias
//
//  Created by Кирилл  Геллерт on 03.05.2022.
//

import UIKit

extension UIViewController {
    
    func setCustomTitle(text: String) {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        
        navigationItem.titleView = label
    }

}
