//
//  AccounView.swift
//  Tonight
//
//  Created by Роман Путинцев on 10.10.2021.
//

import UIKit

class AccountView: UIView {
    
    //MARK: - Vertical stack
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 40
        return stack
    }()
    

    //MARK: - Account header view
    let headerView: AccountHeaderView = {
        return AccountHeaderView()
    }()
    
    //MARK: - Titled block
    let blockView: StackViewTitledItem<RoundedRectView> = {
        let item = StackViewTitledItem<RoundedRectView>()
        item.itemTitleLabel.text = "Ваши оценки"
        return item
    }()
    
    
    // MARK: - Initializers
    init() {
        super.init(frame: CGRect.zero)
        
        self.addSubview(stack)
        
        stack.addArrangedSubview(headerView)
        stack.addArrangedSubview(blockView)
                
        self.stack.translatesAutoresizingMaskIntoConstraints = false
       
        stack.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stack.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        stack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true

    }
    
    
    @available(*, unavailable)
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
//    func setProfileImage(image: UIImage) {
//        self.avatarImageView.image = image
//    }
}

