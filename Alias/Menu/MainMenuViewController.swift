//
//  MainMenuViewController.swift
//  Alias
//
//  Created by Алексей Кузьмин on 05.05.2022.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    let newGameButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = K.Color.primaryInterfaceBackground
        button.layer.cornerRadius = 10
        button.setTitle("Новая игра", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
      
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        return button
    }()
    
    let rulesButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = K.Color.primaryInterfaceBackground
        button.layer.cornerRadius = 10
        button.setTitle("Правила", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
     
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = K.Color.primaryInterfaceBackground
        setupView()
    }
    
    func setupView() {
        view.addSubview(newGameButton)
        view.addSubview(rulesButton)
        
    }
    
}
