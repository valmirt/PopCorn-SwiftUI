//
//  CreditItemView.swift
//  PopCorn-SwiftUI
//
//  Created by Valmir Junior on 06/05/21.
//

import SwiftUI

struct CreditItemView: View {
    @StateObject var viewModel: CreditViewModel
    
    var body: some View {
        VStack {
            ProfileImage(image: viewModel.image, width: 92, height: 92)
                .padding(.vertical, 8)
            Text(viewModel.name)
                .font(.headline)
                .foregroundColor(.primary)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.vertical, 4)
                
            Text(viewModel.charOrJob)
                .font(.headline)
                .foregroundColor(.primary)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .lineLimit(2)
            Spacer()
        }
    }
}

struct CreditItemView_Previews: PreviewProvider {
    static var previews: some View {
        CreditItemView(viewModel: CreditViewModel(castOrCrew: Preview.castOrCrew))
            .previewLayout(.fixed(width: 150, height: 225))
    }
}
