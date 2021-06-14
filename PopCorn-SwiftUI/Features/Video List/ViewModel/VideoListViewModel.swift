//
//  VideoListViewModel.swift
//  PopCorn-SwiftUI
//
//  Created by Valmir Junior on 28/04/21.
//

import Foundation

final class VideoListViewModel: ObservableObject {
    @Published private(set) var movies: [Movie] = []
    private var page = 0
    private var totalPages = Int.max
    private var tab: Tab
    private var queries: [URLQueryItem] {
        if page < totalPages {
            page += 1
        }
        return [
            URLQueryItem(name: "api_key", value: Web.apiKey),
            URLQueryItem(name: "page", value: String(page))
        ]
    }
    var title: String {
        tab.rawValue
    }
    
    init(tab: Tab) {
        self.tab = tab
    }
    
    //MARK: - Intent(s)
    func fetchData(isToReload: Bool = false) async {
        if isToReload {
            page = 0
            movies = []
        }
        if let url = Web.createURL(baseURL: Web.baseUrl, path: "/\(Web.apiVersion)/movie/\(tab.path)", queries: queries) {
            do {
                let (data, response) = try await URLSession.shared.data(from: url)
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { throw NSError() }
                let result = try JSONDecoder().decode(ResponseList<Movie>.self, from: data)
                totalPages = result.totalPages
                movies.append(contentsOf: result.results)
            } catch {
                print(error)
            }
        }
    }
}
