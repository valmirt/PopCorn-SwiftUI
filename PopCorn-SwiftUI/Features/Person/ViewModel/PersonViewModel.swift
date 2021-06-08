//
//  PersonViewModel.swift
//  PopCorn-SwiftUI
//
//  Created by Valmir Junior on 04/06/21.
//

import SwiftUI
import Combine
import Alamofire

final class PersonViewModel: ObservableObject {
    private var idPerson: Int
    
    init(idPerson: Int) {
        self.idPerson = idPerson
    }
}
