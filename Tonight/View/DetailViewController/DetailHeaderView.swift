//
//  DetailViewControllerHeaderViewCollectionReusableView.swift
//  Tonight
//
//  Created by Роман Путинцев on 25.10.2021.
//

import UIKit

final class DetailHeaderView: UICollectionReusableView {
    
    //MARK: - Reuse identifier
    static let reuseIdentifier = "cwhI"
    
    //MARK: - Subviews
    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 7
        imageView.clipsToBounds = true
        return imageView
    }()
    
    //MARK: - Inits
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect){
        super.init(frame: CGRect.zero)

        self.addSubview(posterImageView)
        makeLayout()
    }
    
    //MARK: - Constraints setup
    private func makeLayout() {
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        posterImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        posterImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        posterImageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        posterImageView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
}

