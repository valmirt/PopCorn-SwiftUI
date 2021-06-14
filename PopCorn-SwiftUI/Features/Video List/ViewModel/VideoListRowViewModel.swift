//
//  VideoListRowViewModel.swift
//  PopCorn-SwiftUI
//
//  Created by Valmir Junior on 29/04/21.
//

import SwiftUI

final class VideoListRowViewModel: ObservableObject {
    private let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    //MARK: - Access to the Model
    var title: String {
        movie.title
    }
    var originalTitle: String {
        movie.originalTitle
    }
    var releaseDate: String {
        String(movie.releaseDate.prefix(4))
    }
    var popularity: String {
        String(movie.popularity.round(to: 2))
    }
    var rate: String {
        String(movie.voteAverage.round(to: 2))
    }
    var urlImage: URL? {
        if let posterPath = movie.posterPath {
            let url = Web.createURL(baseURL: Web.baseImageUrl, path: "\(Web.imageW185)\(posterPath)")
            return url
        }
        return nil
    }
}
