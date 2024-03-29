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
    private var taskDetail: AnyCancellable?
    private var taskCredit: AnyCancellable?
    private var taskSimilar: AnyCancellable?
    private var queries: [URLQueryItem] {
        return [
            URLQueryItem(name: "api_key", value: Web.apiKey)
        ]
    }
    
    @Published private var movieDetail: MovieDetail?
    @Published private(set) var backgroundImage: UIImage?
    @Published private(set) var castAndCrew: [CastCrew] = []
    @Published private(set) var similar: [Movie] = []
    
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
        formatter.locale = Locale(identifier: "en-US")
        if let str = formatter.string(for: movieDetail?.budget), str != "$0.00" {
            return "Budget: \(str)"
        }
        return "Budget: Not informed"
    }
    var status: String {
        "Status: \(movieDetail?.status ?? "")"
    }
    var releaseDate: String {
        "Release date: \(movieDetail?.releaseDate ?? "")"
    }
    var popularity: String {
        String(movieDetail?.popularity.round(to: 2) ?? 0)
    }
    var rate: String {
        String(movieDetail?.voteAverage.round(to: 2) ?? 0)
    }
    var genres: String {
        "Genres: \(movieDetail?.genresFormatted ?? "")"
    }
    var overview: String {
        movieDetail?.overview ?? ""
    }
    
    //MARK: - Intent(s)
    func fetchDetail() {
        fetchDetailMovie()
        fetchCredit()
        fetchSimilar()
    }
    
    private func fetchDetailMovie() {
        if let url = Web.createURL(baseURL: Web.baseUrl, path: "/\(Web.apiVersion)/movie/\(id)", queries: queries) {
            taskDetail = AF.request(url, method: .get)
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
    
    private func fetchCredit() {
        if let url = Web.createURL(baseURL: Web.baseUrl, path: "/\(Web.apiVersion)/movie/\(id)/credits", queries: queries) {
            taskCredit = AF.request(url, method: .get)
                .publishDecodable(type: Credit.self)
                .sink(receiveValue: { [weak self] response in
                    guard let self = self else { return }
                    switch response.result {
                    case .success(let data):
                        self.fillCastAndCrew(with: data)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                })
        }
    }
    
    func fetchSimilar() {
        if let url = Web.createURL(baseURL: Web.baseUrl, path: "/\(Web.apiVersion)/movie/\(id)/similar", queries: queries) {
            taskSimilar = AF.request(url, method: .get)
                .publishDecodable(type: ResponseList<Movie>.self)
                .sink(receiveValue: { [weak self] response in
                    guard let self = self else { return }
                    switch response.result {
                    case .success(let data):
                        self.similar.append(contentsOf: data.results)
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
            
            taskDetail = AF.request(url)
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
    
    private func fillCastAndCrew(with credit: Credit) {
        credit.cast.forEach { item in
            castAndCrew.append(CastCrew(id: item.id, name: item.name, charOrJob: item.character, profilePath: item.profilePath))
        }
        credit.crew.forEach { item in
            castAndCrew.append(CastCrew(id: item.id, name: item.name, charOrJob: item.job, profilePath: item.profilePath))
        }
    }
}
