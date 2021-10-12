//
//  RoundedRectView.swift
//  Tonight
//
//  Created by Роман Путинцев on 11.10.2021.
//

import UIKit

class RoundedRectView<T: UIView>: UIView {

    //MARK: - Rounded rect (container) view
    let roundedRect: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowOpacity = 0.1
        
        let borderColor = UIColor(white: 0.05, alpha: 0.1)
      
        view.layer.borderColor = borderColor.cgColor
        view.layer.borderWidth = 0.6
        //view.layer.shadowRadius = 5
        return view
    }()
    
    let contentView: T = {
        return T()
    }()
    
    

    
    init() {
        super.init(frame: CGRect.zero)
        
        self.addSubview(roundedRect)
        self.addSubview(contentView)
        
        
        
        roundedRect.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        roundedRect.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        roundedRect.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        roundedRect.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        roundedRect.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        
        // So bad layout input view is superview... 
        contentView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        contentView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
