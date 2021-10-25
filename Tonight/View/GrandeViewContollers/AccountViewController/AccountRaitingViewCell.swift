//
//  AccountRaitingViewCell.swift
//  Tonight
//
//  Created by Роман Путинцев on 25.10.2021.
//

import UIKit

final class AccountRaitingViewCell: UICollectionViewCell {
    //MARK: - Identifier
    static let identifier = "accountRaitingCellIdentifier"
    
    // MARK: - Subviews
    let accountRaitingView: RoundedRectView<PairedRaitingView> = {
        return RoundedRectView<PairedRaitingView>()
    }()
    
    // MARK: - Inits
    override init(frame: CGRect){
        super.init(frame: .zero)
        
        contentView.addSubview(accountRaitingView)
        
        self.makeLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Constraints setting
    private func makeLayout() {
        accountRaitingView.translatesAutoresizingMaskIntoConstraints = false
        
        accountRaitingView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        accountRaitingView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        accountRaitingView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        accountRaitingView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }

}
