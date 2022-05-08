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
    
    func setCustomBackButton() {
        let config = UIImage.SymbolConfiguration(weight: .bold)
        let image = UIImage(systemName: "arrow.uturn.backward", withConfiguration: config)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(popToViewController))
    }
    
    @objc func popToViewController() {
        navigationController?.popViewController(animated: true)
    }

}
