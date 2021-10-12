//
//  RaitingView.swift
//  Tonight
//
//  Created by Роман Путинцев on 12.10.2021.
//

import UIKit

final class RaitingView: UIView {
    
    var pointsLabel = UILabel()
    var titleLabel = UILabel()
    var suffixLabel = UILabel()

    private func prepare(with points: Int, labeled title: String, _ suffix: String = "%") {
   
        titleLabel.numberOfLines = 2
        
        self.addSubview(pointsLabel)
        self.addSubview(suffixLabel)
        self.addSubview(titleLabel)
        
      
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        suffixLabel.translatesAutoresizingMaskIntoConstraints = false

        pointsLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        pointsLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        suffixLabel.topAnchor.constraint(equalTo: pointsLabel.topAnchor, constant: 6).isActive = true
        suffixLabel.leftAnchor.constraint(equalTo: pointsLabel.rightAnchor, constant: 2).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: suffixLabel.topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: suffixLabel.rightAnchor, constant: 5).isActive = true
        
        self.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: pointsLabel.bottomAnchor).isActive = true
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(){
        super.init(frame: CGRect.zero)
        prepare(with: 0, labeled: "")
    }
    
    func setRaiting(_ points: Int, with suffix: String = "%") {
        pointsLabel.attributedText = NSAttributedString(string: String(points), attributes: [
            .font : UIFont(name: "HelveticaNeue-Bold", size: 38),
            .foregroundColor : UIColor(red: 13 / 255, green: 37 / 255, blue: 63 / 255, alpha: 1)
        ])
        
        suffixLabel.attributedText = NSAttributedString(string: suffix, attributes: [
            .font : UIFont(name: "HelveticaNeue-Bold", size: 15),
            .foregroundColor : UIColor(red: 13 / 255, green: 37 / 255, blue: 63 / 255, alpha: 1)
        ])
    }
    
    func setTitle(_ title: String) {
        titleLabel.attributedText = NSAttributedString(string: title, attributes: [
            .font : UIFont(name: "HelveticaNeue-Bold", size: 14),
            .foregroundColor : UIColor(red: 13 / 255, green: 37 / 255, blue: 63 / 255, alpha: 1)
        ])
        
    }
}

