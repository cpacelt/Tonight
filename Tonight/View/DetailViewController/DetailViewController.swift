//
//  DetailViewController.swift
//  Tonight
//
//  Created by Роман Путинцев on 25.10.2021.
//

import UIKit

final class DetailViewController: UICollectionViewController{
    
    private var posterImage: UIImage
    
    //MARK: - Inits
    init(_ image: UIImage) {
        posterImage = image
        // Init self without layout crashs App
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Layout collection view
    let layout: UICollectionViewLayout = {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Header
        let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8),
                                                      heightDimension: .fractionalWidth(1))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        header.extendsBoundary = true
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [header]
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 15, bottom: 0, trailing: 15)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        
        return layout
    }()
    
    
    //MARK: - Life Circle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.register(DetailHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DetailHeaderView.reuseIdentifier)
        
        
        // Dummy cell
        collectionView.register(FilmViewCell.self, forCellWithReuseIdentifier: FilmViewCell.reuseIdentifier)
        
        makeLayout()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - UICollectionViewDelegates
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilmViewCell.reuseIdentifier, for: indexPath)
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DetailHeaderView.reuseIdentifier, for: indexPath) as! DetailHeaderView
        
        header.posterImageView.image = posterImage
        
        
        
        return header
    }
    
    
    // MARK: - UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    //MARK: - Constraints setup
    private func makeLayout() {
        
    }
    
    deinit{
        print("Detail deinit")
    }
}
