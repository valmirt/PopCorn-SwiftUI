//
//  Movie.swift
//  PopCorn-SwiftUI
//
//  Created by Valmir Junior on 28/04/21.
//

import Foundation

struct Movie: Decodable, Identifiable {
    let backdropPath: String?
    let id: Int
    let popularity: Double
    let releaseDate: String
    let title: String
    let originalTitle: String
    let voteAverage: Double
    let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id
        case popularity
        case releaseDate = "release_date"
        case title
        case originalTitle = "original_title"
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
    }
}
