//
//  StackViewTitledItem.swift
//  Tonight
//
//  Created by Роман Путинцев on 11.10.2021.
//

import UIKit

class StackViewTitledItem: UIView {

    
    //MARK: - Raitings storage view
    let raitingsStorageView: UIView = {
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
        self.addSubview(raitingsStorageView)
        
        itemTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        raitingsStorageView.translatesAutoresizingMaskIntoConstraints = false
        
        itemTitleLabel.leftAnchor.constraint(equalTo: raitingsStorageView.leftAnchor, constant: 5).isActive = true
        itemTitleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        raitingsStorageView.topAnchor.constraint(equalTo: itemTitleLabel.bottomAnchor, constant: 10).isActive = true
        raitingsStorageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        raitingsStorageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        raitingsStorageView.heightAnchor.constraint(equalToConstant: 200).isActive = true

        self.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
