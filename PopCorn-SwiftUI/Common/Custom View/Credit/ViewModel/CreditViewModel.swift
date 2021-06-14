//
//  CreditViewModel.swift
//  PopCorn-SwiftUI
//
//  Created by Valmir Junior on 06/05/21.
//

import SwiftUI

final class CreditViewModel: ObservableObject {
    private let castOrCrew: CastCrew
    
    //MARK: - Access to the Model
    var name: String {
        castOrCrew.name
    }
    var charOrJob: String {
        castOrCrew.charOrJob
    }
    var urlImage: URL? {
        if let profilePath = castOrCrew.profilePath {
            let url = Web.createURL(baseURL: Web.baseImageUrl, path: "\(Web.imageW185)\(profilePath)")
            return url
        }
        return nil
    }
    
    init(castOrCrew: CastCrew) {
        self.castOrCrew = castOrCrew
    }
}

