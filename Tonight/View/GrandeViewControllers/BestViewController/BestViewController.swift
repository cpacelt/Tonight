//
//  BestViewController.swift
//  Tonight
//
//  Created by Роман Путинцев on 13.10.2021.
//

import UIKit
import SwiftUI


final class BestViewController: UICollectionViewController {
    
    //MARK: - Inits
    init() {
        // Init self without layout crash App
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Layout Best VC's collection view
    let layout: UICollectionViewLayout = {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.9))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 15, bottom: 0, trailing: 15)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }()
    
    //MARK: - Life Circle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        self.title = self.tabBarItem.title
        
        collectionView.register(FilmViewCell.self, forCellWithReuseIdentifier: FilmViewCell.reuseIdentifier)
 
    }
    
    //MARK: - Delegate methods
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(DetailViewController(UIImage(named: "dune")!), animated: true)
        
    }
    //MARK: - Datasource methods
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilmViewCell.reuseIdentifier, for: indexPath) as! FilmViewCell
        
        cell.posterImageView.image = UIImage(named: "dune")
        
        return cell
    }
    
}

