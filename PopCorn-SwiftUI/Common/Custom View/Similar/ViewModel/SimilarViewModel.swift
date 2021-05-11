//
//  SimilarViewModel.swift
//  PopCorn-SwiftUI
//
//  Created by Valmir Junior on 11/05/21.
//

import SwiftUI
import Alamofire
import Combine


final class SimilarViewModel: ObservableObject {
    private let movie: Movie
    private var task: AnyCancellable?
    
    init(movie: Movie) {
        self.movie = movie
        loadImage()
    }
    
    //MARK: - Access to the Model
    @Published private(set) var image: UIImage?
    
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
