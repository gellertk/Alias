//
//  ViewController.swift
//  Alias
//
//  Created by Кирилл  Геллерт on 02.05.2022.
//

import UIKit

class StartViewController: UIViewController {
    
    private let startView = StartView()
    
    override func loadView() {
        view = startView
    }

}

