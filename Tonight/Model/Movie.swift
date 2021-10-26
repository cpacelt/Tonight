//
//  Film.swift
//  Tonight
//
//  Created by Роман Путинцев on 26.10.2021.
//

import Foundation

struct Movie {
    let id: Int
    let isAdult: Bool?
    let title: String?
    let overview: String?
    let posterPath: String?
    
    let genres: [Genre]?
    
}

struct Genre {
    let id: Int?
    let name: String?
}
