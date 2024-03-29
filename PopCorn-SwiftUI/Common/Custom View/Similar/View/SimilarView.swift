//
//  SimilarView.swift
//  PopCorn-SwiftUI
//
//  Created by Valmir Junior on 11/05/21.
//

import SwiftUI

struct SimilarView: View {
    @ObservedObject var viewModel: SimilarViewModel
    
    var body: some View {
        Group {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
            } else {
                Image(systemName: "photo")
                    .resizable()
            }
        }
        .scaledToFit()
        .frame(width: widthImage, height: heightImage)
        .foregroundColor(.gray)
        .cornerRadius(cornerRadiusImage)
    }
    
    //MARK: - Constants
    private let heightImage: CGFloat = 190
    private let widthImage: CGFloat = 125
    private let cornerRadiusImage: CGFloat = 4
}

struct SimilarView_Previews: PreviewProvider {
    static var previews: some View {
        SimilarView(viewModel: SimilarViewModel(movie: Preview.movie))
            .previewLayout(.fixed(width: 125, height: 190))
    }
}
