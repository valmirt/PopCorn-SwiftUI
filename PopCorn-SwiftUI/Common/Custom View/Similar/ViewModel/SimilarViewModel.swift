//
//  SimilarViewModel.swift
//  PopCorn-SwiftUI
//
//  Created by Valmir Junior on 11/05/21.
//

import SwiftUI

final class SimilarViewModel: ObservableObject {
    private let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    //MARK: - Access to the Model
    var urlImage: URL? {
        if let posterPath = movie.posterPath {
            let url = Web.createURL(baseURL: Web.baseImageUrl, path: "\(Web.imageW185)\(posterPath)")
            return url
        }
        return nil
    }
}
