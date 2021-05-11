//
//  CreditViewModel.swift
//  PopCorn-SwiftUI
//
//  Created by Valmir Junior on 06/05/21.
//

import SwiftUI
import Combine
import Alamofire

final class CreditViewModel: ObservableObject {
    private let castOrCrew: CastCrew
    private var task: AnyCancellable?
    
    //MARK: - Access to the Model
    @Published private(set) var image: UIImage?
    
    var name: String {
        castOrCrew.name
    }
    var charOrJob: String {
        castOrCrew.charOrJob
    }
    
    init(castOrCrew: CastCrew) {
        self.castOrCrew = castOrCrew
        loadImageProfile()
    }
    
    private func loadImageProfile() {
        if let profilePath = castOrCrew.profilePath, let url = Web.createURL(baseURL: Web.baseImageUrl, path: "\(Web.imageW185)\(profilePath)") {
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

