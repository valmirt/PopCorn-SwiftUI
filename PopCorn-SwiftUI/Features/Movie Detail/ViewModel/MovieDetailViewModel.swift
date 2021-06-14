//
//  MovieDetailViewModel.swift
//  PopCorn-SwiftUI
//
//  Created by Valmir Junior on 29/04/21.
//

import SwiftUI

@MainActor
final class MovieDetailViewModel: ObservableObject {
    private var id: Int
    private var queries: [URLQueryItem] {
        return [
            URLQueryItem(name: "api_key", value: Web.apiKey)
        ]
    }
    
    @Published private var movieDetail: MovieDetail?
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
    var backgroundURL: URL? {
        if let backdropPath = movieDetail?.backdropPath {
            let url = Web.createURL(baseURL: Web.baseImageUrl, path: "\(Web.imageW780)\(backdropPath)")
            return url
        }
        return nil
    }
    
    //MARK: - Intent(s)
    func fetchDetail() {
        async {
            await fetchDetailMovie()
            await fetchCredit()
            await fetchSimilar()
        }
    }
    
    private func fetchDetailMovie() async {
        if let url = Web.createURL(baseURL: Web.baseUrl, path: "/\(Web.apiVersion)/movie/\(id)", queries: queries) {
            do {
                let (data, response) = try await URLSession.shared.data(from: url)
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { throw NSError() }
                let result = try JSONDecoder().decode(MovieDetail.self, from: data)
                movieDetail = result
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func fetchCredit() async {
        if let url = Web.createURL(baseURL: Web.baseUrl, path: "/\(Web.apiVersion)/movie/\(id)/credits", queries: queries) {
            do {
                let (data, response) = try await URLSession.shared.data(from: url)
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { throw NSError() }
                let result = try JSONDecoder().decode(Credit.self, from: data)
                fillCastAndCrew(with: result)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchSimilar() async {
        if let url = Web.createURL(baseURL: Web.baseUrl, path: "/\(Web.apiVersion)/movie/\(id)/similar", queries: queries) {
            do {
                let (data, response) = try await URLSession.shared.data(from: url)
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { throw NSError() }
                let result = try JSONDecoder().decode(ResponseList<Movie>.self, from: data)
                similar.append(contentsOf: result.results)
            } catch {
                print(error.localizedDescription)
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
