//
//  MovieDetail.swift
//  PopCorn
//
//  Created by Valmir Torres on 10/11/19.
//  Copyright © 2019 Valmir Torres. All rights reserved.
//

import Foundation

struct MovieDetail : Decodable {
    let id: Int
    let backdropPath: String?
    let budget: Int
    let genres: [Genre]
    let originalLanguage: String
    let originalTitle: String
    let overview: String?
    let popularity: Double
    let posterPath: String?
    let productionCompanies: [Company]
    let productionCountries: [Country]
    let releaseDate: String
    let revenue: Int
    let runtime: Int?
    let status: String
    let title: String
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id
        case budget
        case genres
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue
        case runtime
        case status
        case title
        case voteAverage = "vote_average"
    }
}

struct Country: Decodable {
    let name: String
}

struct Company: Decodable {
    let name: String
}

struct Genre: Decodable {
    let name: String
}
