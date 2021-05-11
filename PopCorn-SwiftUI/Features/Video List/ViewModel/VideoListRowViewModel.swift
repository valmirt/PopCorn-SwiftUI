//
//  VideoListRowViewModel.swift
//  PopCorn-SwiftUI
//
//  Created by Valmir Junior on 29/04/21.
//

import SwiftUI
import Combine
import Alamofire

final class VideoListRowViewModel: ObservableObject {
    private let movie: Movie
    private var task: AnyCancellable?
    
    init(movie: Movie) {
        self.movie = movie
        loadImage()
    }
    
    //MARK: - Access to the Model
    @Published private(set) var image: UIImage?
    
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
    
    private func loadImage() {
        if let posterPath = movie.posterPath, let url = Web.createURL(baseURL: Web.baseImageUrl, path: "\(Web.imageW185)\(posterPath)") {
            if let image = Web.cache.object(forKey: url.absoluteString as NSString) {
                self.image = image
                return
            }
            
            task = AF.request(url)
                .publishData()
                .sink { [weak self] response in
                    guard let self = self else { return }
                    switch response.result {
                    case .success(let data):
                        if let image = UIImage(data: data) {
                            self.image = image
                            Web.cache.setObject(image, forKey: url.absoluteString as NSString)
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
        }
    }
}
