//
//  VideoListRow.swift
//  PopCorn-SwiftUI
//
//  Created by Valmir Junior on 28/04/21.
//

import SwiftUI

struct VideoListRow: View {
    @StateObject var viewModel: VideoListRowViewModel
    
    var body: some View {
        HStack {
            ImageVideo(viewModel: viewModel)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(viewModel.title)
                    .font(.title2)
                    .fontWeight(.medium)
                    .lineLimit(lineLimit)
                
                Text(viewModel.title)
                    .font(.title3)
                    .fontWeight(.thin)
                    .lineLimit(lineLimit)
                
                VideoLabel(title: viewModel.popularity, imageName: "heart.fill")
                
                HStack {
                    VideoLabel(title: viewModel.rate, imageName: "star.fill")
                    Spacer()
                    Text(viewModel.releaseDate)
                        .font(.body)
                        .fontWeight(.thin)
                }
            }
            .padding(.leading)
            Spacer()
        }
        .padding(4)
    }
    
    private let lineLimit = 1
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
                    .frame(height: heightImage)
                    .foregroundColor(.accentColor)
            }
        )
    }
    
    private let heightImage: CGFloat = 18
}

struct ImageVideo: View {
    @ObservedObject var viewModel: VideoListRowViewModel
    
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
    private let heightImage: CGFloat = 118
    private let widthImage: CGFloat = 78
    private let cornerRadiusImage: CGFloat = 4
}

struct VideoListRow_Previews: PreviewProvider {
    static var previews: some View {
        VideoListRow(viewModel: VideoListRowViewModel(movie: Preview.movie))
            .previewLayout(.fixed(width: 400, height: 160))
    }
}
