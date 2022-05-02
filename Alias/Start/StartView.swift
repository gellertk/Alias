//
//  StartView.swift
//  Alias
//
//  Created by Кирилл  Геллерт on 02.05.2022.
//

import UIKit

class StartView: UIView {
    
    private let newGameButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapNewGameButton), for: .touchUpInside)
        button.backgroundColor = .white
       
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension StartView {
    
    @objc func didTapNewGameButton() {
        
    }
    
    func setupView() {
        backgroundColor = .blue
        [newGameButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            newGameButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            newGameButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            newGameButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
            newGameButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
}
