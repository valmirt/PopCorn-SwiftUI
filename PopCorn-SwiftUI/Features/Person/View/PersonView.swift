//
//  PersonView.swift
//  PopCorn-SwiftUI
//
//  Created by Valmir Junior on 04/06/21.
//

import SwiftUI

struct PersonView: View {
    @StateObject var viewModel: PersonViewModel
    
    var body: some View {
        VStack {
            
        }
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView(viewModel: PersonViewModel())
    }
}
