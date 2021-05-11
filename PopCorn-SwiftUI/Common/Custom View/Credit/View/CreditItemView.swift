//
//  CreditItemView.swift
//  PopCorn-SwiftUI
//
//  Created by Valmir Junior on 06/05/21.
//

import SwiftUI

struct CreditItemView: View {
    @ObservedObject var viewModel: CreditViewModel
    
    var body: some View {
        VStack {
            ProfileImage(image: viewModel.image)
                .padding(.vertical, 8)
            Text(viewModel.name)
                .font(.headline)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.vertical, 4)
                
            Text(viewModel.charOrJob)
                .font(.headline)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .lineLimit(2)
            Spacer()
        }
    }
}

struct ProfileImage: View {
    var image: UIImage?
    
    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
            } else {
                Image(systemName: "person.fill")
                    .resizable()
            }
        }
        .scaledToFill()
        .foregroundColor(.gray)
        .frame(width: 92, height: 92)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.accentColor, lineWidth: 2))
    }
}

struct CreditItemView_Previews: PreviewProvider {
    static var previews: some View {
        CreditItemView(viewModel: CreditViewModel(castOrCrew: Preview.castOrCrew))
            .previewLayout(.fixed(width: 150, height: 225))
    }
}
