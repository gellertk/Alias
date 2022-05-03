//
//  MainNavigationController.swift
//  Alias
//
//  Created by Кирилл  Геллерт on 03.05.2022.
//

import UIKit

class MainNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = K.Color.primaryInterfaceBackground
        view.backgroundColor = K.Color.primaryInterfaceBackground
    }
    
}
