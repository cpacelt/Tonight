//
//  BestViewController.swift
//  Tonight
//
//  Created by Роман Путинцев on 13.10.2021.
//

import UIKit
import SwiftUI


final class BestViewController: UICollectionViewController {
    
    var movieList: MovieList? = nil
    var imageCash = [String : UIImage]()
    
    //MARK: - Inits
    init() {
        // Init self without layout crash App
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Layout Best VC's collection view
    let layout: UICollectionViewLayout = {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.9))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 15, bottom: 0, trailing: 15)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }()
    
    //MARK: - Life Circle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        self.title = self.tabBarItem.title
        
        collectionView.register(FilmViewCell.self, forCellWithReuseIdentifier: FilmViewCell.reuseIdentifier)
        
        
        //MARK: - Data manager request
        let m = NetworkManager()
        m.get(MovieList.self, with: .topRated) { [weak self] list in
            self!.movieList = list
            self!.collectionView.reloadData()
        }
    }
    
    //MARK: - Delegate methods
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let list = movieList else { return 0 }
        guard let movies = list.movies else { return 0}
        
        return movies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(DetailViewController(imageCash[movieList!.movies![indexPath.row].posterPath!]!), animated: true)
        
    }
    //MARK: - Datasource methods
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilmViewCell.reuseIdentifier, for: indexPath) as! FilmViewCell
        
        guard let list = movieList else { return cell }
        guard let movies = list.movies else { return cell}
        cell.titleLabel.text = movies[indexPath.row].title
        
        
        let m = NetworkManager()
        m.get(Movie.self, byId: movies[indexPath.row].id!) { [weak self] movie in
            if let genres = movie.genres {
                var genresStrings = [String]()
                for genre in genres {
                    if genre.id == genres.first?.id {
                        genresStrings.append(genre.name!.firstUppercased)
                    }
                    genresStrings.append(genre.name!)
                }
                
                let genresFormatedString = genresStrings.joined(separator: ", ")
                cell.genresLabel.text = genresFormatedString
            }
        }
        
        if let image = imageCash[movies[indexPath.row].posterPath!] {
            DispatchQueue.main.async {
                cell.posterImageView.image = image
            }
        } else {
            m.getData(from: movies[indexPath.row].posterPath!) { [weak self] data in
                DispatchQueue.main.async {
                    cell.posterImageView.image = UIImage(data: data!)
                    self!.imageCash[movies[indexPath.row].posterPath!] = UIImage(data: data!)
                }
            }
        }
        
        //cell.posterImageView.image = UIImage(named: "dune")
        return cell
    }
}
    
    // MARK: - String extension to uppercase first letter. Needed to delete it
    extension StringProtocol {
        var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
        var firstCapitalized: String { prefix(1).capitalized + dropFirst() }
    }
