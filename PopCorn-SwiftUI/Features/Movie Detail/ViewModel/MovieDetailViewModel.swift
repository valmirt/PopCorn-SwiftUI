//
//  MovieDetailViewModel.swift
//  PopCorn-SwiftUI
//
//  Created by Valmir Junior on 29/04/21.
//

import SwiftUI
import Combine
import Alamofire

final class MovieDetailViewModel: ObservableObject {
    private var id: Int
    private var task: AnyCancellable?
    private var queries: [URLQueryItem] {
        return [
            URLQueryItem(name: "api_key", value: Web.apiKey)
        ]
    }
    
    @Published private var movieDetail: MovieDetail?
    @Published private(set) var backgroundImage: UIImage?
    
    init(idMovie: Int) {
        id = idMovie
        fetchDetail()
    }
    
    //MARK: - Access to the Model
    var originalTitle: String {
        movieDetail?.originalTitle ?? ""
    }
    var title: String {
        movieDetail?.title ?? ""
    }
    var runtime: String {
        "Runtime: \(String(movieDetail?.runtime ?? 0)) min"
    }
    var budget: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        if let str = formatter.string(for: movieDetail?.budget), str != "$0.00" {
            return "Budget: \(str)"
        }
        return "Budget: Not informed"
    }
    var status: String {
        "Status: \(movieDetail?.status ?? "")"
    }
    var releaseDate: String {
        "ReleaseDate: \(movieDetail?.releaseDate ?? "")"
    }
    var popularity: String {
        String(format: "%.1f", movieDetail?.popularity ?? 0)
    }
    var rate: String {
        String(format: "%.1f", movieDetail?.voteAverage ?? 0)
    }
    var genres: String {
        "Genres: \(movieDetail?.genresFormatted ?? "")"
    }
    var countries: String {
        "Countries: \(movieDetail?.countriesFormatted ?? "")"
    }
    var companies: String {
        "Companies: \(movieDetail?.companiesFormatted ?? "")"
    }
    
    //MARK: - Intent(s)
    func fetchDetail() {
        if let url = Web.createURL(baseURL: Web.baseUrl, path: "/\(Web.apiVersion)/movie/\(id)", queries: queries) {
            task = AF.request(url, method: .get)
                .publishDecodable(type: MovieDetail.self)
                .sink(receiveValue: { [weak self] response in
                    guard let self = self else { return }
                    switch response.result {
                    case .success(let data):
                        self.movieDetail = data
                        self.loadImage()
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                })
        }
    }
    
    private func loadImage() {
        if let backdropPath = movieDetail?.backdropPath,
           let url = Web.createURL(baseURL: Web.baseImageUrl, path: "\(Web.imageW780)\(backdropPath)") {
            if let image = Web.cache.object(forKey: url.absoluteString as NSString) {
                self.backgroundImage = image
                return
            }
            
            task = AF.request(url)
                .publishData()
                .sink { [weak self] response in
                    guard let self = self else { return }
                    switch response.result {
                    case .success(let data):
                        if let image = UIImage(data: data) {
                            self.backgroundImage = image
                            Web.cache.setObject(image, forKey: url.absoluteString as NSString)
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
        }
    }
}
