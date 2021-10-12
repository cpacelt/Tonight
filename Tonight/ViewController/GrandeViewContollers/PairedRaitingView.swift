//
//  PairedRaitingView.swift
//  Tonight
//
//  Created by Роман Путинцев on 12.10.2021.
//

import UIKit

class PairedRaitingView: UIView {

    let firstRaitingView = RaitingView()
    let secondRaitingView = RaitingView()
    
    init() {
        super.init(frame: CGRect.zero)
        
        self.addSubview(firstRaitingView)
        self.addSubview(secondRaitingView)
        
        firstRaitingView.translatesAutoresizingMaskIntoConstraints = false
        secondRaitingView.translatesAutoresizingMaskIntoConstraints = false
        
        firstRaitingView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        firstRaitingView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        
        secondRaitingView.leftAnchor.constraint(equalTo: firstRaitingView.rightAnchor, constant: 20).isActive = true
        secondRaitingView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        self.rightAnchor.constraint(equalTo: secondRaitingView.rightAnchor).isActive = true
        
        //self.backgroundColor = .systemIndigo
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
