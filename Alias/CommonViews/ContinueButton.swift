//
//  ContinueButton.swift
//  Alias
//
//  Created by Кирилл  Геллерт on 03.05.2022.
//

import UIKit

class ContinueButton: UIButton {
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension ContinueButton {
    
    func setupView() {
        setTitle("Продолжить", for: .normal)
        titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
        backgroundColor = K.Color.secondaryInterfaceBackground
        layer.cornerRadius = K.Numeric.defaultCornerRadius
        isEnabled = false
        addShadow()
    }
    
}
