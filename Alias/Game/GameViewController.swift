//
//  GameViewController.swift
//  Alias
//
//  Created by Полина Дусин on 04.05.2022.
//

import UIKit

class GameViewController: UIViewController {
    
    private let cardLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = K.Color.cardBackground
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20
        label.text = "КАРТОЧКА"
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let currentScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Очки: 0"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let circularProgressBar: CircularProgressBarView = {
        let progressBar = CircularProgressBarView()
//        progressBar.translatesAutoresizingMaskIntoConstraints = false
        
        return progressBar
    }()
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let resetGameButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = K.Color.secondaryButtonColor
        button.layer.cornerRadius = 10
        button.setTitle("Сброс", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(resetGameButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let correctWordButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = K.Color.correctButtonColor
        button.layer.cornerRadius = 10
        button.setTitle("✔︎", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.addTarget(self, action: #selector(correctWordButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let skipWordButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = K.Color.skipButtonColor
        button.layer.cornerRadius = 10
        button.setTitle("▶︎▶︎", for: .normal)
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
    
    var timer = Timer()
    
    var durationTimer = 60
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = K.Color.primaryInterfaceBackground
        setupView()
        setConstraints()
        timerLabel.text = "\(durationTimer)"
        startTimer()
    }
    
    @objc func resetGameButtonPressed() {
        print("resetGameButtonPressed")
    }
    
    @objc func skipWordButtonPressed() {
        print("skipWordButtonPressed")
    }
    
    @objc func correctWordButtonPressed() {
        print("correctWordButtonPressed")
    }
    
    func startTimer() {
        circularProgressBar.circleAnimation()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @objc func timerAction() {
        durationTimer -= 1
        timerLabel.text = "\(durationTimer)"
        
        if durationTimer == 0 {
            timer.invalidate()
        }
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
