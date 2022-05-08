//
//  RulesViewController.swift
//  Alias
//
//  Created by Георгий Гречин on 04.05.2022.
//

import UIKit

class RulesViewController: UIViewController {
    
    private let rulesView = RulesView()
    
    override func loadView() {
        view = rulesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomTitle(text: "ПРАВИЛА")
        setCustomBackButton()
    }
    
}

