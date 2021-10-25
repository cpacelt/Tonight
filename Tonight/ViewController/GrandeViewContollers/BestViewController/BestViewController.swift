//
//  BestViewController.swift
//  Tonight
//
//  Created by Роман Путинцев on 13.10.2021.
//

import UIKit
import SwiftUI

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

    
    private func createUICollectionViewLayout() -> UICollectionViewLayout {
                
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.9))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
              
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 15, bottom: 0, trailing: 15)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
}


extension BestViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilmCollectionViewCell.identifier, for: indexPath) as! FilmCollectionViewCell
        
        return cell
    }

}
