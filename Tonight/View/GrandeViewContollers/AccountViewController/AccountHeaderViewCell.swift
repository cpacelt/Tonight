//
//  AccountViewCellCollectionViewCell.swift
//  Tonight
//
//  Created by Роман Путинцев on 25.10.2021.
//

import UIKit

final class AccountHeaderViewCell: UICollectionViewCell {
    
    //MARK: - Identifier
    static let identifier = "accountCellIdentifier"
    
    //MARK: - Subviews
    let accountHeaderView: AccountHeaderView = {
        return AccountHeaderView()
    }()
    
    //MARK: - Inits
    override init(frame: CGRect){
        super.init(frame: .zero)
        
        contentView.addSubview(accountHeaderView)
        
        self.makeLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    //MARK: - Constraints setting
    private func makeLayout() {
        accountHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        accountHeaderView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        accountHeaderView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        accountHeaderView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
    }
    
}
