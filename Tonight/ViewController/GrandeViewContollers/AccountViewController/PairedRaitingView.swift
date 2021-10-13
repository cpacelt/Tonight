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
    private let stack = UIStackView()
    
    private let lineView: UIView = {
        let view = UIView()
        let borderColor = UIColor(white: 0.05, alpha: 0.1)  //Magic numbers
        view.layer.borderColor = borderColor.cgColor
        view.layer.borderWidth = 0.6 // Magic numbers
        return view
    }()
    
    init() {
        
        super.init(frame: CGRect.zero)
        
        stack.axis = .horizontal
        stack.spacing = 30
        stack.alignment = .center
        
        stack.addArrangedSubview(firstRaitingView)
        stack.addArrangedSubview(lineView)
        stack.addArrangedSubview(secondRaitingView)
        
        self.addSubview(stack)

        stack.translatesAutoresizingMaskIntoConstraints = false
        lineView.translatesAutoresizingMaskIntoConstraints = false

        stack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stack.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stack.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        stack.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        lineView.heightAnchor.constraint(equalTo: firstRaitingView.heightAnchor).isActive = true
        lineView.widthAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
