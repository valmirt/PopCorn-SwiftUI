//
//  MovieDetailExtension.swift
//  PopCorn-SwiftUI
//
//  Created by Valmir Junior on 05/05/21.
//

import Foundation

extension MovieDetail {
    
    var genresFormatted: String? {
        return genres
            .compactMap({ $0.name })
            .sorted()
            .joined(separator: " | ")
    }
    
    var countriesFormatted: String? {
        return productionCountries
            .compactMap({ $0.name })
            .sorted()
            .joined(separator: " | ")
    }
    
    var companiesFormatted: String? {
        return productionCompanies
            .compactMap({ $0.name })
            .sorted()
            .joined(separator: " | ")
    }
    
    var yearDate: String? {
        return String(releaseDate.split(separator: "-").first ?? "")
    }
}
