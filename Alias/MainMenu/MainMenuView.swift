//
//  MainMenuView.swift
//  Alias
//
//  Created by Кирилл  Геллерт on 07.05.2022.
//

import UIKit

protocol MainMenuViewDelegate: AnyObject {
    func didTapNewGameButton()
    func didTapRulesButton()
}

class MainMenuView: UIView {
    
    weak var delegate: MainMenuViewDelegate?
    
    private let customTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Alias"
        label.font = .systemFont(ofSize: 60, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var newGameButton: CommonButton = {
        let button = CommonButton(type: .newGame)
        button.addTarget(self, action: #selector(didTapNewGameButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var rulesButton: CommonButton = {
        let button = CommonButton(type: .rules)
        button.addTarget(self, action: #selector(didTapRulesButton), for: .touchUpInside)
        
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

private extension MainMenuView {
    
    func setupView() {
        backgroundColor = K.Color.primaryInterfaceBackground
        addSubviews([customTitleLabel,
                     newGameButton,
                     rulesButton])
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            customTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            customTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100),

            rulesButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30),
            rulesButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            rulesButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            newGameButton.leadingAnchor.constraint(equalTo: rulesButton.leadingAnchor),
            newGameButton.trailingAnchor.constraint(equalTo: rulesButton.trailingAnchor),
            newGameButton.bottomAnchor.constraint(equalTo: rulesButton.topAnchor, constant: -10)
        ])
    }
    
}

private extension MainMenuView {
    
    @objc func didTapNewGameButton() {
        delegate?.didTapNewGameButton()
    }
    
    @objc func didTapRulesButton() {
        delegate?.didTapRulesButton()
    }
    
}
