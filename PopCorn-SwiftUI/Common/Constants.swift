//
//  Constants.swift
//  PopCorn-SwiftUI
//
//  Created by Valmir Junior on 28/04/21.
//

import Foundation

enum Web {
    static let BASE_URL = "https://api.themoviedb.org"
    static let BASE_URL_IMAGE = "https://image.tmdb.org"
    static let IMAGE_W45 = "/t/p/w45"
    static let IMAGE_W185 = "/t/p/w185"
    static let IMAGE_W300 = "/t/p/w300"
    static let IMAGE_W342 = "/t/p/w342"
    static let IMAGE_W500 = "/t/p/w500"
    static let IMAGE_W780 = "/t/p/w780"
    static let API_KEY = "ebf3f29bcec9455240223a565fb2a81d"
    static let VERSION_API = "3"
}

enum General {
    static let FIRST = 1
    static let OFFSET = 5
}

enum Preview {
    static let movie = Movie(
        backdropPath: "/fCayJrkfRaCRCTh8GqN30f8oyQF.jpg",
        id: 0,
        popularity: 0.5,
        releaseDate: "1999-10-29",
        title: "Fight Club",
        voteAverage: 7.8,
        posterPath: "/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg"
    )
}
