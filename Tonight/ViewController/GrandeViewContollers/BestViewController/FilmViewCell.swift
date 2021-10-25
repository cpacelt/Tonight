//
//  FilmCollectionViewCell.swift
//  Tonight
//
//  Created by Роман Путинцев on 13.10.2021.
//

import UIKit

class FilmCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FilmCollectionViewCellIdentifier"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(
            string: "Дюна",
            attributes: [
            .font : UIFont(name: "HelveticaNeue-Bold", size: 25),
            .foregroundColor : UIColor(white: 1.0, alpha: 0.9)
        ])
        return label
    }()
    
    let genresLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(
            string: "Фантастика, драма",
            attributes: [
            .font : UIFont(name: "HelveticaNeue", size: 15),
            .foregroundColor : UIColor(white: 0.8, alpha: 0.9)
        ])
        return label
    }()
    
    
    let posterImageView: UIImageView = {
        let image = UIImage(named: "dune")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect){
        super.init(frame: .zero)
        
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(genresLabel)
        
        self.makeLayout()
        
    }
    
    //MARK: - Constraints setting
    private func makeLayout() {
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        genresLabel.translatesAutoresizingMaskIntoConstraints = false
        
        posterImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        posterImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        posterImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: genresLabel.topAnchor, constant: -5).isActive = true
        
        genresLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        genresLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

