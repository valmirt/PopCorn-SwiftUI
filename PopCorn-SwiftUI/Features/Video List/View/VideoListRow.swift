//
//  VideoListRow.swift
//  PopCorn-SwiftUI
//
//  Created by Valmir Junior on 28/04/21.
//

import SwiftUI

struct VideoListRow: View {
    @ObservedObject var viewModel: VideoListRowViewModel
    
    var body: some View {
        HStack {
            Image(uiImage: viewModel.image)
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 65, height: 98)
                .foregroundColor(.gray)
                .cornerRadius(3)
                .padding(.trailing)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(viewModel.title)
                    .font(.title2)
                    .fontWeight(.medium)
                    .lineLimit(2)
                
                VideoLabel(title: viewModel.popularity, imageName: "heart.fill")
                HStack {
                    VideoLabel(title: viewModel.rate, imageName: "star.fill")
                    Spacer()
                    Text(viewModel.releaseDate)
                        .font(.body)
                        .fontWeight(.thin)
                }
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct VideoLabel: View {
    var title: String
    var imageName: String
    
    var body: some View {
        Label(
            title: {
                Text(title)
                    .font(.body)
                    .fontWeight(.thin)
            },
            icon: {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 18)
                    .foregroundColor(.accentColor)
            }
        )
    }
}

struct VideoListRow_Previews: PreviewProvider {
    static var previews: some View {
        VideoListRow(viewModel: VideoListRowViewModel(movie: Preview.movie))
            .previewLayout(.fixed(width: 400, height: 140))
    }
}
