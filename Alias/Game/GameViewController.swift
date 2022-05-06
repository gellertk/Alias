//
//  GameViewController.swift
//  Alias
//
//  Created by Полина Дусин on 04.05.2022.
//

import UIKit

class GameViewController: UIViewController, CircularProgressBarViewDelegate, GameBrainDelegate {
    private let cardLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = K.Color.cardBackground
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20
        label.text = ""
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let currentScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Очки:"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let circularProgressBar = CircularProgressBarView()
 
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let resetGameButton: CommonButton = {
        let button = CommonButton(type: .resetGame)
        button.backgroundColor = K.Color.secondaryButton
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(resetGameButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let correctWordButton: CommonButton = {
        let button = CommonButton(type: .correctCard)
        button.backgroundColor = K.Color.correctButton
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.addTarget(self, action: #selector(correctWordButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let skipWordButton: CommonButton = {
        let button = CommonButton(type: .skipCard)
        button.backgroundColor = K.Color.skipButton
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.addTarget(self, action: #selector(skipWordButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var topStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [resetGameButton,circularProgressBar, currentScoreLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints =  false
        
        return stackView
    }()
    
    lazy var bottomStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [skipWordButton, correctWordButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints =  false
        
        return stackView
    }()
                
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = K.Color.primaryInterfaceBackground
        setupView()
        setConstraints()
        circularProgressBar.delegate = self
        game.delegate = self
        circularProgressBar.startTimer()
        game.startGame()
    }
    
    // CircularProgressBarViewDelegate
    func didChangeDuration(duration: UInt) {
        timerLabel.text = "\(duration)"
    }
    
    // CircularProgressBarViewDelegate
    func timerIsOver() {
        game.lastCard()
    }
    
    @objc func resetGameButtonPressed() {
        circularProgressBar.stopTimer()
        game.resetGame()
        
        // Переход с GameViewController на MainMenuViewController
        let nextViewController = MainMenuViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @objc func skipWordButtonPressed() {
        game.skipCard(card: cardLabel.text ?? "")
    }
    
    @objc func correctWordButtonPressed() {
        game.correctCard(card: cardLabel.text ?? "")
    }
    
    // GameBrainDelegate
    func didScoreChanged(currentScore: Int) {
        currentScoreLabel.text = "Очки: \(currentScore)"
    }
    
    // GameBrainDelegate
    func didCardChanged(currentCard: String) {
        cardLabel.text = currentCard
    }
    
    // GameBrainDelegate
    func gameOver(currentScore: Int) {
        // Переход с GameViewController на FinishViewController
        let nextViewController = FinishViewController(score: currentScore)
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    // MARK: - setup View
    private func setupView() {
        view.addSubview(cardLabel)
        view.addSubview(topStackView)
        view.addSubview(bottomStackView)
        circularProgressBar.addSubview(timerLabel)
    }
}

// MARK: - setup constraints
extension GameViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            cardLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            cardLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            resetGameButton.heightAnchor.constraint(equalTo: topStackView.heightAnchor, multiplier: 1),
            resetGameButton.widthAnchor.constraint(equalTo: topStackView.widthAnchor, multiplier: 0.33),
            timerLabel.heightAnchor.constraint(equalTo: topStackView.heightAnchor, multiplier: 1),
            timerLabel.widthAnchor.constraint(equalTo: topStackView.widthAnchor, multiplier: 0.33),
            currentScoreLabel.heightAnchor.constraint(equalTo: topStackView.heightAnchor, multiplier: 1),
            currentScoreLabel.widthAnchor.constraint(equalTo: topStackView.widthAnchor, multiplier: 0.33),
            
            bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            correctWordButton.heightAnchor.constraint(equalTo: bottomStackView.heightAnchor, multiplier: 1),
            correctWordButton.widthAnchor.constraint(equalTo: bottomStackView.widthAnchor, multiplier: 0.49),
            skipWordButton.heightAnchor.constraint(equalTo: bottomStackView.heightAnchor, multiplier: 1),
            skipWordButton.widthAnchor.constraint(equalTo: bottomStackView.widthAnchor, multiplier: 0.49)
        ])
    }
}

// MARK: - SwiftUI
import SwiftUI

struct AuthenticationViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all).previewInterfaceOrientation(.portrait)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = GameViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<AuthenticationViewControllerProvider.ContainerView>) -> GameViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: AuthenticationViewControllerProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<AuthenticationViewControllerProvider.ContainerView>) {
            
        }
    }
}
