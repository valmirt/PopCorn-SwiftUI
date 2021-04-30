//
//  VideoListViewModel.swift
//  PopCorn-SwiftUI
//
//  Created by Valmir Junior on 28/04/21.
//

import Foundation
import Combine
import Alamofire

final class VideoListViewModel: ObservableObject {
    @Published private(set) var movies: [Movie] = []
    private var task: AnyCancellable?
    private var page = 0
    private var totalPages = Int.max
    private var queries: [URLQueryItem] {
        if page < totalPages {
            page += 1
        }
        return [
            URLQueryItem(name: "api_key", value: Web.apiKey),
            URLQueryItem(name: "page", value: String(page))
        ]
    }
    
    //MARK: - Intent(s)
    func fetchData(isToReload: Bool = false) {
        if isToReload {
            page = 0
            movies = []
        }
        if let url = Web.createURL(baseURL: Web.baseUrl, path: "/\(Web.apiVersion)/movie/popular", queries: queries) {
            task = AF.request(url, method: .get)
                .publishDecodable(type: ResponseList<Movie>.self)
                .sink(receiveValue: { [weak self] response in
                    guard let self = self else { return }
                    switch response.result {
                    case .success(let data):
                        self.totalPages = data.totalPages
                        self.movies.append(contentsOf: data.results)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                })
        }
    }
}
