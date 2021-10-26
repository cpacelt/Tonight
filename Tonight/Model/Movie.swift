//
//  Film.swift
//  Tonight
//
//  Created by Роман Путинцев on 26.10.2021.
//

import Foundation

struct MovieList: ApiObject {
    static var apiPath: String? = "movie/"
    
    let movies: [Movie]?
    
    enum CodingKeys: String, CodingKey {
        case movies = "results"
      }
}

struct Movie : ApiObject {
    
    static var apiPath: String? = "movie/"
    
    let id: Int?
    let isAdult: Bool?
    let title: String?
    let overview: String?
    let posterPath: String?
    
    var genres: [Genre]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case isAdult
        case title
        case overview
        case posterPath = "poster_path"
        case genres
      }
}


struct Genre: Decodable {
    let id: Int?
    let name: String?
}
