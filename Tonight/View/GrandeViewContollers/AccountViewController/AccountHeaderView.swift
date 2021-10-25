//
//  AccountHeaderView.swift
//  Tonight
//
//  Created by Роман Путинцев on 11.10.2021.
//

import UIKit


final class AccountHeaderView: UIView {
    
    //MARK: - Subviews
    // Avatar Image
    let avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.contentMode = .scaleAspectFit
       // avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.borderColor = UIColor(red: 1 / 255, green: 180 / 255, blue: 228 / 255, alpha: 1).cgColor
        avatarImageView.layer.borderWidth = 3
        
        return avatarImageView
    }()

    //Nickname label
    let nicknameLabel: UILabel = {
        let text = "cpacelt"
        let label = UILabel()
        //label.text = nickname
        label.attributedText = NSAttributedString(string: text, attributes: [
            .font : UIFont(name: "HelveticaNeue-Bold", size: 30),
            .foregroundColor : UIColor(red: 13 / 255, green: 37 / 255, blue: 63 / 255, alpha: 1)
        ])
        
        return label
    }()

    //Email label
    let emailLabel: UILabel = {
        let text = "cpacelt@gmail.com"
        let label = UILabel()
        //label.text = nickname
        label.attributedText = NSAttributedString(string: text, attributes: [
            .font : UIFont(name: "HelveticaNeue-Bold", size: 15),
            .foregroundColor : UIColor(red: 1 / 255, green: 180 / 255, blue: 228 / 255, alpha: 1)
        ])
        
        return label
    }()

    //Register since label
    let registeredSinceLabel: UILabel = {
        let date = "Смотрю кино с октября 2015 года"
        let label = UILabel()
        //label.text = nickname
        label.attributedText = NSAttributedString(string: date, attributes: [
            .font : UIFont(name: "HelveticaNeue", size: 10),
            .foregroundColor : UIColor.gray
        ])
        
        return label
    }()

    // MARK: - Inits
    init() {
        super.init(frame: CGRect.zero)
        
        self.addSubview(self.avatarImageView)
        self.addSubview(self.nicknameLabel)
        self.addSubview(self.emailLabel)
        self.addSubview(self.registeredSinceLabel)
              
        makeLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Constraints setting
    private func makeLayout() {
        self.avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        self.nicknameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.emailLabel.translatesAutoresizingMaskIntoConstraints = false
        self.registeredSinceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        avatarImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        avatarImageView.widthAnchor.constraint(equalTo: self.avatarImageView.heightAnchor).isActive = true
        avatarImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        avatarImageView.layer.cornerRadius = 40
        avatarImageView.clipsToBounds = true
        
        nicknameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor).isActive = true
        nicknameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        
        emailLabel.leftAnchor.constraint(equalTo: nicknameLabel.leftAnchor).isActive = true
        emailLabel.topAnchor.constraint(equalTo: nicknameLabel.bottomAnchor, constant: 8).isActive = true
        
        registeredSinceLabel.leftAnchor.constraint(equalTo: emailLabel.leftAnchor).isActive = true
        registeredSinceLabel.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor).isActive = true
        
        self.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor).isActive = true
    }
    

}
