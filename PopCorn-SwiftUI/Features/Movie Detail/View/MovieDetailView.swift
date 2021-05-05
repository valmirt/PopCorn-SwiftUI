//
//  MovieDetailView.swift
//  PopCorn-SwiftUI
//
//  Created by Valmir Junior on 29/04/21.
//

import SwiftUI

struct MovieDetailView: View {
    @ObservedObject var viewModel: MovieDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                BackgroundImage(viewModel.backgroundImage)
                    .frame(height: 260)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text(viewModel.title)
                        .font(.title)
                        .fontWeight(.medium)
                        .lineLimit(3)
                        .padding(.top, 12)
                    Text(viewModel.originalTitle)
                        .font(.title3)
                        .lineLimit(3)
                    
                    Text(viewModel.genres)
                        .font(.body)
                        .fontWeight(.light)
                        .lineLimit(3)
                    
                    HStack(alignment: .top, spacing: 12) {
                        VStack(alignment: .leading, spacing: 12) {
                            Text(viewModel.runtime)
                                .font(.body)
                                .fontWeight(.light)
                                .lineLimit(1)
                            Text(viewModel.budget)
                                .font(.body)
                                .fontWeight(.light)
                                .lineLimit(1)
                            Text(viewModel.status)
                                .font(.body)
                                .fontWeight(.light)
                                .lineLimit(1)
                            Text(viewModel.releaseDate)
                                .font(.body)
                                .fontWeight(.light)
                                .lineLimit(1)
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            MovieLabel(text: viewModel.popularity, imageName: "heart.fill")
                            MovieLabel(text: viewModel.rate, imageName: "star.fill")
                        }
                    }
                    .padding(.top)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text(viewModel.countries)
                            .font(.body)
                            .fontWeight(.light)
                            .lineLimit(3)
                        Text(viewModel.companies)
                            .font(.body)
                            .fontWeight(.light)
                            .lineLimit(3)
                    }
                    .padding(.top)
                }
                .padding(.horizontal)
                Spacer()
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

struct BackgroundImage: View {
    var backgroundImage: UIImage?
    
    init(_ image: UIImage? = nil) {
        backgroundImage = image
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                if let image = backgroundImage {
                    Image(uiImage: image)
                        .resizable()
                } else {
                    Image(systemName: "photo")
                        .resizable()
                }
            }
            .clipped()
            .foregroundColor(.gray)
            
            Image("gradient")
                .resizable()
                .frame(height: 100)
        }
    }
}

struct MovieLabel: View {
    var text: String
    var imageName: String
    
    var body: some View {
        Label(
            title: {
                Text(text)
                    .font(.body)
                    .fontWeight(.light)
                    .lineLimit(1)
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

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MovieDetailView(viewModel: MovieDetailViewModel(idMovie: -1))
        }
    }
}
