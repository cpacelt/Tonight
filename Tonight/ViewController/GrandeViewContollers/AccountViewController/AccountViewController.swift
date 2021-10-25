//
//  accountViewController.swift
//  Tonight
//
//  Created by Роман Путинцев on 10.10.2021.
//

import UIKit

final class AccountViewController: UICollectionViewController {
    
    let layout: UICollectionViewLayout = {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
              
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 15, bottom: 0, trailing: 15)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.tabBarItem.title
        self.view.backgroundColor = .systemBackground
        
        collectionView.register(AccountHeaderViewCell.self, forCellWithReuseIdentifier: AccountHeaderViewCell.identifier)
        collectionView.register(AccountRaitingViewCell.self, forCellWithReuseIdentifier: AccountRaitingViewCell.identifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    
    init() {
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let headerCell = collectionView.dequeueReusableCell(withReuseIdentifier: AccountHeaderViewCell.identifier, for: indexPath)
        let raitingCell = collectionView.dequeueReusableCell(withReuseIdentifier: AccountRaitingViewCell.identifier, for: indexPath) as! AccountRaitingViewCell
        
        if indexPath.row % 2 == 0 {
            return headerCell
        } else {
            raitingCell.accountRaitingView.contentView.firstRaitingView.setTitle("Hello")
            raitingCell.accountRaitingView.contentView.firstRaitingView.setRaiting(100)
            raitingCell.accountRaitingView.contentView.secondRaitingView.setTitle("Hello")
            
            return raitingCell
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
}
