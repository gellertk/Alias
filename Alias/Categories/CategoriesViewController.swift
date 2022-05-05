//
//  CategoryViewController.swift
//  Alias
//
//  Created by Кирилл  Геллерт on 03.05.2022.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    var categories: [Category] = []
    
    private let categoryView = CategoriesView()
    
    override func loadView() {
        view = categoryView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categories = game.getCategories()
        setupDelegates()
        setCustomTitle(text: "ВЫБЕРИТЕ КАТЕГОРИИ СЛОВ")
    }
    
}

private extension CategoriesViewController {
    
    func setupDelegates() {
        categoryView.categoriesCollectionView.delegate = self
        categoryView.categoriesCollectionView.dataSource = self
        categoryView.delegate = self
    }
    
}

extension CategoriesViewController: CategoriesViewDelegate {
    
    func didTapContinueButton() {
        // Переход с CategoriesViewController на GameViewController
        let nextViewController = GameViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension CategoriesViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CategoriesCollectionViewCell {
            categories[indexPath.row].isSelected.toggle()
            cell.toggleCheckmark(categories[indexPath.row])
            categoryView.setupContinueButtonAvailability(isEnabled: categories.contains(where: { $0.isSelected }))
        }
    }
    
}

extension CategoriesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.reuseId,
                                                            for: indexPath) as? CategoriesCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.setupContent(with: categories[indexPath.row])
        
        return cell
    }
    
}

extension CategoriesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingWidth = K.EdgeInset.categoriesSectionInserts.left * (K.Numeric.categoriesItemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / K.Numeric.categoriesItemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem - widthPerItem / 3.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return K.EdgeInset.categoriesSectionInserts
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return K.EdgeInset.categoriesSectionInserts.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return K.EdgeInset.categoriesSectionInserts.left
    }
}
