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
        guard let type = type else {
            return
        }
        if let imageName = type.imageName {
            let config = UIImage.SymbolConfiguration(pointSize: 40, weight: .bold)
            let image = UIImage(systemName: imageName, withConfiguration: config)
            setImage(image, for: .normal)
            tintColor = .white
        } else {
            setTitle(type.rawValue, for: .normal)
        }
        backgroundColor = type.backgroundColor
        titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
        layer.cornerRadius = K.Numeric.defaultCornerRadius
        isEnabled = type != .continueGame
        addShadow()
        setupConstraints()
    }
    
    func setupConstraints() {
        heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
}
