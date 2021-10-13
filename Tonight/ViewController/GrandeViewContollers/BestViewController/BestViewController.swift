//
//  BestViewController.swift
//  Tonight
//
//  Created by Роман Путинцев on 13.10.2021.
//

import UIKit

class BestViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = .systemBackground
        self.title = self.tabBarItem.title
        
        let collection = UICollectionView(frame: view.bounds, collectionViewLayout: createUICollectionViewLayout())

        collection.register(FilmCollectionViewCell.self, forCellWithReuseIdentifier: FilmCollectionViewCell.identifier)
        
        self.view.addSubview(collection)
        collection.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        
        collection.delegate = self
        collection.dataSource = self
        // Do any additional setup after loading the view.
    }

    
    func createUICollectionViewLayout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95), heightDimension: .fractionalHeight(0.8))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95), heightDimension: .absolute(250))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(20)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
       // section.interGroupSpacing = 20
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
        
    }
    
}


extension BestViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilmCollectionViewCell.identifier, for: indexPath)
        
        //cell.contentView.addSubview(RaitingView())
       // cell.backgroundColor = .systemIndigo
        
        return cell
    }
    
    
}
