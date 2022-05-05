//
//  FinishViewController.swift
//  Alias
//
//  Created by Кирилл  Геллерт on 05.05.2022.
//

import UIKit

class FinishViewController: UIViewController {
    
    var score: Int?
    
    private let finishView = FinishView()
    
    override func loadView() {
        finishView.delegate = self
        view = finishView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getJoke()
        guard let score = score else {
            return
        }
        finishView.setupScoreLabel(score: score)
    }
    
    init(score: Int) {
        self.score = score
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

private extension FinishViewController {
    
    func getJoke() {
        NetworkManager.shared.getJoke { [weak self] result in
            switch result {
            case .success(let joke):
                DispatchQueue.main.async {
                    self?.finishView.setupJokeLabel(setup: joke.setup, punchline: joke.punchline)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

extension FinishViewController: FinishViewDelegate {
    
    func didTapNewGameButton() {
        guard let categoriesVC = navigationController?.viewControllers.filter({$0.isKind(of: CategoriesViewController.self)}).first else {
            return
        }
        navigationController?.popToViewController(categoriesVC, animated: true)
    }
    
}
