//
//  StackViewTitledItem.swift
//  Tonight
//
//  Created by Роман Путинцев on 11.10.2021.
//

import UIKit

class StackViewTitledItem<T: UIView>: UIView {

    
    //MARK: Item content view
    let itemView: T = {
        let view = T()
        return view
    }()
    
    //MARK: - Block title view
    let itemTitleLabel: UILabel = {
        let text = "Placeholder"
        let label = UILabel()
        label.attributedText = NSAttributedString(string: text, attributes: [
            .font : UIFont(name: "HelveticaNeue-Bold", size: 18),
            .foregroundColor : UIColor(red: 13 / 255, green: 37 / 255, blue: 63 / 255, alpha: 1)
        ])
        return label
    }()
   
    init(){
        super.init(frame: CGRect.zero)
        
        self.addSubview(itemTitleLabel)
        self.addSubview(itemView)
        
        itemTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        itemView.translatesAutoresizingMaskIntoConstraints = false
        
        itemTitleLabel.leftAnchor.constraint(equalTo: itemView.leftAnchor, constant: 5).isActive = true
        itemTitleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        itemView.topAnchor.constraint(equalTo: itemTitleLabel.bottomAnchor, constant: 10).isActive = true
        itemView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        itemView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        itemView.heightAnchor.constraint(equalToConstant: 100).isActive = true

        self.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
