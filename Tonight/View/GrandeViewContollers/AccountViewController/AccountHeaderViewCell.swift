//
//  AccountViewCellCollectionViewCell.swift
//  Tonight
//
//  Created by Роман Путинцев on 25.10.2021.
//

import UIKit

class AccountHeaderViewCell: UICollectionViewCell {
    static let identifier = "accountCellIdentifier"
    
    let accountHeaderView: AccountHeaderView = {
        return AccountHeaderView()
    }()
    
    override init(frame: CGRect){
        super.init(frame: .zero)
        
        contentView.addSubview(accountHeaderView)

        self.makeLayout()
    }
    
    //MARK: - Constraints setting
    private func makeLayout() {
        accountHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        accountHeaderView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        accountHeaderView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        accountHeaderView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
