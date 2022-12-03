//
//  Constants.swift
//  PopCorn-SwiftUI
//
//  Created by Valmir Junior on 28/04/21.
//

import UIKit

enum Web {
    static let baseUrl = "https://api.themoviedb.org"
    static let baseImageUrl = "https://image.tmdb.org"
    static let imageW45 = "/t/p/w45"
    static let imageW185 = "/t/p/w185"
    static let imageW300 = "/t/p/w300"
    static let imageW342 = "/t/p/w342"
    static let imageW500 = "/t/p/w500"
    static let imageW780 = "/t/p/w780"
    static let apiKey = ""
    static let apiVersion = "3"
    static let cache = NSCache<NSString, UIImage>()
    
    static func createURL(baseURL: String, path: String, queries: [URLQueryItem]? = nil) -> URL? {
        var component = URLComponents(string: baseURL)
        component?.path = path
        component?.queryItems = queries
        return component?.url
    }
}

enum General {
    static let first = 1
    static let offset = 5
}

enum Preview {
    static let movie = Movie(
        backdropPath: "/fCayJrkfRaCRCTh8GqN30f8oyQF.jpg",
        id: 0,
        popularity: 0.5,
        releaseDate: "1999-10-29",
        title: "Lord of the Rings: The Fellowship of the ring",
        originalTitle: "Lord of the Rings: The Fellowship of the ring",
        voteAverage: 7.8,
        posterPath: "/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg"
    )
    
    static let castOrCrew = CastCrew(
        id: -1,
        name: "Quentin Tarantino",
        charOrJob: "Director",
        profilePath: "/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg"
    )
}
