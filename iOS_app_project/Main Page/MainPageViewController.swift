//
//  MainPageViewController.swift
//  iOS_app_project
//
//  Created by Мария Караваева on 08.03.2020.
//  Copyright © 2020 Игорь Кузнецов. All rights reserved.
//

import UIKit

class MainPageViewController: UICollectionViewController {
    private enum PresentationStyle: String, CaseIterable {
        case table
        case defaultGrid
        case customGrid
        
        var buttonImage: UIImage {
            switch self {
            case .table: return #imageLiteral(resourceName: "icon80.jpg")
            case .defaultGrid: return #imageLiteral(resourceName: "icon87.jpg")
            case .customGrid: return #imageLiteral(resourceName: "icon180.jpg")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        self.tabBarController?.navigationItem.hidesBackButton = true
        self.tabBarController?.navigationItem.title = "Список объявлений"
    }
    
    private var selectedStyle: PresentationStyle = .table {
        didSet { updatePresentationStyle() }
    }
    private var styleDelegates: [PresentationStyle: CollectionViewSelectableItemDelegate] = {
        let result: [PresentationStyle: CollectionViewSelectableItemDelegate] = [
            .table: TabledContentCollectionViewDelegate(),
            .defaultGrid: DefaultGriddedContentCollectionViewDelegate(),
            .customGrid: CustomGriddedContentCollectionViewDelegate(),
        ]
        result.values.forEach {
            $0.didSelectItem = { _ in
                print("Item selected")
            }
        }
        return result
    }()
    
    private var datasource: [MainPage] = MainPageProvider.get()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(MainPageCollectionViewCell.nib,
                                      forCellWithReuseIdentifier: MainPageCollectionViewCell.reuseID)
        collectionView.contentInset = .zero
        updatePresentationStyle()
        
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(image: selectedStyle.buttonImage, style: .plain, target: self, action: #selector(changeContentLayout))
    }
    
    private func updatePresentationStyle() {
        collectionView.delegate = styleDelegates[selectedStyle]
        collectionView.performBatchUpdates({
            collectionView.reloadData()
        }, completion: nil)

        self.tabBarController?.navigationItem.rightBarButtonItem?.image = selectedStyle.buttonImage
    }
    
    @objc private func changeContentLayout() {
        let allCases = PresentationStyle.allCases
        guard let index = allCases.firstIndex(of: selectedStyle) else { return }
        let nextIndex = (index + 1) % allCases.count
        selectedStyle = allCases[nextIndex]
        
    }
}

// MARK: UICollectionViewDataSource & UICollectionViewDelegate
extension MainPageViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainPageCollectionViewCell.reuseID,
                                                            for: indexPath) as? MainPageCollectionViewCell else {
            fatalError("Wrong cell")
        }
        let MainPage = datasource[indexPath.item]
        cell.update(title: MainPage.name, image: MainPage.icon)
        return cell
    }
}
