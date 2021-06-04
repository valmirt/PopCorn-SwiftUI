//
//  Tab.swift
//  PopCorn-SwiftUI
//
//  Created by Valmir Junior on 04/06/21.
//

import SwiftUI

enum Tab: String {
    case popular = "Popular"
    case nowPlaying = "Now Playing"
    case topRated = "Top Rated"
    
    var icon: Image {
        switch self {
        case .popular: return Image(systemName: "heart.fill")
        case .nowPlaying: return Image(systemName: "pin.fill")
        case .topRated: return Image(systemName: "star.fill")
        }
    }
    
    var path: String {
        switch self {
        case .popular: return "popular"
        case .nowPlaying: return "now_playing"
        case .topRated: return "top_rated"
        }
    }
}
