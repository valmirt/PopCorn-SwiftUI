//
//  Movie.swift
//  PopCorn-SwiftUI
//
//  Created by Valmir Junior on 28/04/21.
//

import Foundation

struct Movie: Decodable {
    let backdropPath: String?
    let id: Int
    let popularity: Double
    let releaseDate: String
    let title: String
    let voteAverage: Double
    let posterPath: String?
}
