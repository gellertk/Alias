//
//  CategoriesCollectionViewCell.swift
//  Alias
//
//  Created by Кирилл  Геллерт on 03.05.2022.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "CategoriesCollectionViewCell"
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                shrink(direction: .down)
            } else {
                shrink(direction: .up)
            }
        }
    }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        
        return imageView
    }()
    
    private let checkmarkImageView: UIImageView = {
        let imageView = UIImageView()
        let config = UIImage.SymbolConfiguration(pointSize: 30)
        imageView.image = UIImage(systemName: "checkmark.circle.fill", withConfiguration: config)
        imageView.tintColor = K.Color.secondaryInterfaceBackground
        imageView.isHidden = true
        
        return imageView
    }()
    
    private let backgroundWhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContent(with category: Category) {
        checkmarkImageView.isHidden = !category.isSelected
        backgroundWhiteView.isHidden = !category.isSelected
        titleLabel.text = category.title
        imageView.image = UIImage(named: category.imageName ?? "")?.withAlpha(0.4)
    }
    
    func toggleCheckmark(_ category: Category) {
        checkmarkImageView.isHidden = !category.isSelected
        backgroundWhiteView.isHidden = !category.isSelected
        imageView.image = UIImage(named: category.imageName ?? "")?.withAlpha(0.4)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        checkmarkImageView.layer.cornerRadius = checkmarkImageView.bounds.width / 2
        imageView.layer.cornerRadius = K.Numeric.defaultCornerRadius
        imageView.layer.masksToBounds = true
    }
    
}

private extension CategoriesCollectionViewCell {
    
    func setupView() {
        contentView.layer.cornerRadius = K.Numeric.defaultCornerRadius
        layer.cornerRadius = K.Numeric.defaultCornerRadius
        [imageView, titleLabel, backgroundWhiteView, checkmarkImageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        setupConstraints()
        addShadow()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            backgroundWhiteView.widthAnchor.constraint(equalToConstant: 20),
            backgroundWhiteView.heightAnchor.constraint(equalToConstant: 20),
            backgroundWhiteView.centerXAnchor.constraint(equalTo: checkmarkImageView.centerXAnchor),
            backgroundWhiteView.centerYAnchor.constraint(equalTo: checkmarkImageView.centerYAnchor),
            
            checkmarkImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            checkmarkImageView.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}
