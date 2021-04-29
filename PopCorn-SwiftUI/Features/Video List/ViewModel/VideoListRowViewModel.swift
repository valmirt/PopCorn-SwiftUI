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
    
    @Published private(set) var image = UIImage(systemName: "photo")!
    
    var title: String {
        movie.title
    }
    var releaseDate: String {
        String(movie.releaseDate.prefix(4))
    }
    var popularity: String {
        String(format: "%.1f", movie.popularity)
    }
    var rate: String {
        String(format: "%.1f", movie.voteAverage)
    }
}
