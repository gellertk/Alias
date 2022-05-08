//
//  MainMenuViewController.swift
//  Alias
//
//  Created by Алексей Кузьмин on 05.05.2022.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    private let mainMenuView = MainMenuView()
    
    override func loadView() {
        mainMenuView.delegate = self
        view = mainMenuView
    }
    
}

extension MainMenuViewController: MainMenuViewDelegate {
    
    func didTapNewGameButton() {
        navigationController?.pushViewController(CategoriesViewController(game: Game()), animated: true)
    }
    
    func didTapRulesButton() {
        navigationController?.pushViewController(RulesViewController(), animated: true)
    }
    
}
