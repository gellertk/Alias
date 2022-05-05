//
//  FinishView.swift
//  Alias
//
//  Created by Кирилл  Геллерт on 05.05.2022.
//

import UIKit

protocol FinishViewDelegate: AnyObject {
    func didTapNewGameButton()
}

class FinishView: UIView {
    
    weak var delegate: FinishViewDelegate?
    
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 40, weight: .medium)
        
        return label
    }()
    
    private let jokeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 25, weight: .medium)
        
        return label
    }()
    
    private lazy var newGameButton: UIButton = {
        let button = CommonButton(type: .newGame)
        button.addTarget(self, action: #selector(didTapNewGameButton), for: .touchUpInside)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupScoreLabel(score: Int) {
        scoreLabel.text = "Набрано очков: \(score)"
    }
    
    func setupJokeLabel(setup: String, punchline: String) {
        jokeLabel.text = "\(setup) \n \n \(punchline)"
    }
    
}

private extension FinishView {
    
    @objc func didTapNewGameButton() {
        delegate?.didTapNewGameButton()
    }
    
    func setupView() {
        backgroundColor = K.Color.primaryInterfaceBackground
        [scoreLabel, jokeLabel, newGameButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scoreLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            scoreLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            
            jokeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            jokeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            jokeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            newGameButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            newGameButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            newGameButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
    }
    
}
