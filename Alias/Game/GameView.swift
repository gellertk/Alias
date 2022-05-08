//
//  GameView.swift
//  Alias
//
//  Created by Кирилл  Геллерт on 07.05.2022.
//

import UIKit

protocol GameViewDelegate: AnyObject {
    func didTapResetButton()
    func didTapSkipButton()
    func didTapCorrectButton()
}

class GameView: UIView {
    
    weak var delegate: GameViewDelegate?
    
    private let cardLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = K.Color.cardBackground
        label.layer.masksToBounds = true
        label.layer.cornerRadius = K.Numeric.defaultCornerRadius
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    private let currentScoreLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 45)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        
        return label
    }()
    
    let circularProgressBar = CircularProgressBarView()
    
    private lazy var resetGameButton: CommonButton = {
        let button = CommonButton(type: .resetGame)
        button.addTarget(self, action: #selector(didTapResetButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var correctButton: CommonButton = {
        let button = CommonButton(type: .correctCard)
        button.addTarget(self, action: #selector(didTapCorrectButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var skipButton: CommonButton = {
        let button = CommonButton(type: .skipCard)
        button.addTarget(self, action: #selector(didTapSkipButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var topStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [resetGameButton,
                                                       circularProgressBar,
                                                       currentScoreLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 70
        
        return stackView
    }()
    
    private lazy var bottomStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [skipButton, correctButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        return stackView
    }()
                
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func didChangeDuration(duration: UInt) {
        circularProgressBar.updateTimerLabel(duration)
    }
    
    func update(card: String, score: Int) {
        cardLabel.text = card
        currentScoreLabel.text = "\(score)"
    }
    
    func update(card: String) {
        cardLabel.text = card
    }
    
    func update(score: Int) {
        currentScoreLabel.text = "\(score)"
    }

}

private extension GameView {
    
    func setupView() {
        backgroundColor = K.Color.primaryInterfaceBackground
        addSubviews([topStackView,
                     cardLabel,
                     bottomStackView])
        setupConstraints()
    }
    
    // MARK: - setup constraints
    func setupConstraints() {
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            topStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            cardLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            cardLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            cardLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
            cardLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            
            bottomStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            bottomStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            bottomStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
}

private extension GameView {
    
    @objc func didTapResetButton() {
        delegate?.didTapResetButton()
    }
    
    @objc func didTapSkipButton() {
        delegate?.didTapSkipButton()
    }
    
    @objc func didTapCorrectButton() {
        delegate?.didTapCorrectButton()
    }
    
}
