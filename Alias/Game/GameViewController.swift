//
//  GameViewController.swift
//  Alias
//
//  Created by Полина Дусин on 04.05.2022.
//

import UIKit

class GameViewController: UIViewController {
    
    private var game: Game?
    
    private var timer: Timer?
    private var timerDuration: UInt = K.Numeric.roundDuration
    
    private let gameView = GameView()
    
    init(_ game: Game) {
        super.init(nibName: nil, bundle: nil)
        self.game = game
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        gameView.delegate = self
        view = gameView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let game = game else {
            return
        }
        let firstCard = game.getFirstCard()
        gameView.update(card: firstCard, score: 0)
        startTimer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
}

extension GameViewController: GameViewDelegate {
    
    func didTapResetButton() {
        
        //MARK: Переход с GameViewController на MainMenuViewController
        guard let mainMenuVC = navigationController?.viewControllers.filter({$0.isKind(of: MainMenuViewController.self)}).first else {
            return
        }
        navigationController?.popToViewController(mainMenuVC, animated: true)
    }
    
    func didTapSkipButton() {
        handleNextButton(isSolved: false)
    }
    
    func didTapCorrectButton() {
        handleNextButton(isSolved: true)
    }
    
}

private extension GameViewController {
    
    @objc func timerAction() {
        timerDuration -= 1
        gameView.didChangeDuration(duration: timerDuration)
        
        if timerDuration == 0 {
            stopTimer()
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    func handleNextButton(isSolved: Bool) {
        guard let game = game else {
            return
        }
        
        let nextCard = game.getNextCard(currentIsSolved: isSolved)
        
        if timer == nil || nextCard.isEmpty {
            gameView.update(score: game.score)
            let nextViewController = FinishViewController(score: game.score)
            navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            gameView.update(card: nextCard, score: game.score)
        }
    }
    
}


