//
//  CategoryView.swift
//  Alias
//
//  Created by Кирилл  Геллерт on 03.05.2022.
//

import UIKit

protocol CategoriesViewDelegate: AnyObject {
    func didTapContinueButton()
}

class CategoriesView: UIView {
    
    weak var delegate: CategoriesViewDelegate?
    
    lazy var categoriesCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(CategoriesCollectionViewCell.self,
                                forCellWithReuseIdentifier: CategoriesCollectionViewCell.reuseId)
        collectionView.backgroundColor = .white
        collectionView.layer.cornerRadius = K.Numeric.defaultCornerRadius
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delaysContentTouches = false
        
        return collectionView
    }()
    
    private lazy var continueButton: CommonButton = {
        let button = CommonButton(type: .continueGame)
        button.addTarget(self, action: #selector(didTapContinueButton), for: .touchUpInside)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContinueButtonAvailability(isEnabled: Bool) {
        continueButton.isEnabled = isEnabled
    }
    
}

private extension CategoriesView {
    
    @objc func didTapContinueButton() {
        delegate?.didTapContinueButton()
    }
    
    func setupView() {
        backgroundColor = K.Color.primaryInterfaceBackground
        [categoriesCollectionView, continueButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            continueButton.trailingAnchor.constraint(equalTo: categoriesCollectionView.trailingAnchor),
            continueButton.leadingAnchor.constraint(equalTo: categoriesCollectionView.leadingAnchor),
            continueButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
            categoriesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            categoriesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            categoriesCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            categoriesCollectionView.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -10)
        ])
    }
    
}

//MARK: - SwiftUI
//import SwiftUI
//struct CompostitionalProvider: PreviewProvider {
//    static var previews: some View {
//        ContainterView().edgesIgnoringSafeArea(.all)
//    }
//
//    struct ContainterView: UIViewControllerRepresentable {
//
//        let tabBar = CategoriesViewController()
//        func makeUIViewController(context: UIViewControllerRepresentableContext<CompostitionalProvider.ContainterView>) -> CategoriesViewController {
//            return tabBar
//        }
//
//        func updateUIViewController(_ uiViewController: CompostitionalProvider.ContainterView.UIViewControllerType, context: UIViewControllerRepresentableContext<CompostitionalProvider.ContainterView>) {
//        }
//    }
//}
