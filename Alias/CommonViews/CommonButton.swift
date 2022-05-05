//
//  ContinueButton.swift
//  Alias
//
//  Created by Кирилл  Геллерт on 03.05.2022.
//

import UIKit

class CommonButton: UIButton {
    
    private let type: CommonButtonType?
    
    override var isEnabled: Bool {
        didSet {
            if !isEnabled {
                setTitleColor(.white.withAlphaComponent(0.3), for: .normal)
            } else {
                setTitleColor(.white, for: .normal)
            }
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                shrink(direction: .down)
            } else {
                shrink(direction: .up)
            }
        }
    }
    
    init(type: CommonButtonType) {
        self.type = type
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension CommonButton {
    
    func setupView() {
        setTitle(type?.rawValue, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
        backgroundColor = K.Color.secondaryInterfaceBackground
        layer.cornerRadius = K.Numeric.defaultCornerRadius
        addShadow()
        setupConstraints()
        isEnabled = type != .continueGame
    }
    
    func setupConstraints() {
        heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
}
