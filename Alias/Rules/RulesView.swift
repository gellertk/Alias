//
//  RulesView.swift
//  Alias
//
//  Created by Кирилл  Геллерт on 07.05.2022.
//

import UIKit

class RulesView: UIView {
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .white
        textView.isEditable = false
        textView.isSelectable = false
        textView.layer.cornerRadius = K.Numeric.defaultCornerRadius
        let finalAttributedString = NSMutableAttributedString()
        for (index, text) in K.String.rulesText.enumerated() {
            if index % 2 == 0 {
                finalAttributedString.append(NSAttributedString(string: text + " \n", attributes: K.StringAttribute.titleText))
            } else {
                finalAttributedString.append(NSAttributedString(string: text + " \n\n", attributes: K.StringAttribute.defaultText))
            }
        }
        textView.attributedText = finalAttributedString
        
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension RulesView {
    
    func setupView() {
        addSubviews([textView])
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            textView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            textView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
