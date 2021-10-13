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
    
    //MARK: - You marks view
    let marksView: StackViewTitledItem<RoundedRectView<PairedRaitingView>> = {
        let item = StackViewTitledItem<RoundedRectView<PairedRaitingView>>()
        item.itemTitleLabel.text = "Ваши оценки"
        
        item.itemView.contentView.firstRaitingView.setTitle("Рейтинг\nфильмов")
        item.itemView.contentView.firstRaitingView.setRaiting(12)

        item.itemView.contentView.secondRaitingView.setRaiting(24)
        item.itemView.contentView.secondRaitingView.setTitle("Рейтинг\nсериалов")
        
        return item
    }()
    
    
    // MARK: - Initializers
    init() {
        super.init(frame: CGRect.zero)
        
        self.addSubview(stack)
        
        stack.addArrangedSubview(headerView)
        stack.addArrangedSubview(marksView)
        
        self.stack.translatesAutoresizingMaskIntoConstraints = false
       
        stack.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stack.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        stack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
    }
    
    
    @available(*, unavailable)
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

