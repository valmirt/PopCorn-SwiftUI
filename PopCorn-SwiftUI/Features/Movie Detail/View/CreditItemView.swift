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
                .padding()
            Text("Name")
                .font(.headline)
                .fontWeight(.semibold)
            Text("Character")
                .font(.headline)
                .fontWeight(.regular)
                .padding(.vertical)
            Spacer()
        }
        .padding()
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
        .frame(width: 78, height: 78)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.accentColor, lineWidth: 2))
    }
}

struct CreditItemView_Previews: PreviewProvider {
    static var previews: some View {
        CreditItemView(viewModel: CreditViewModel())
            .previewLayout(.fixed(width: 150, height: 225))
    }
}
