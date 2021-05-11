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
                
                MovieInfo(
                    title: viewModel.title,
                    originalTitle: viewModel.originalTitle,
                    genres: viewModel.genres,
                    runtime: viewModel.runtime,
                    budget: viewModel.budget,
                    status: viewModel.status,
                    releaseDate: viewModel.releaseDate,
                    popularity: viewModel.popularity,
                    rate: viewModel.rate
                )
                .padding(.horizontal)
                
                Text("Overview:")
                    .font(.title2)
                    .padding([.horizontal, .top])
                
                Text(viewModel.overview)
                    .font(.body)
                    .fontWeight(.light)
                    .lineLimit(nil)
                    .padding(.horizontal)
                    .padding(.top, 6)
                    .fixedSize(horizontal: false, vertical: true)
                
                Text("Cast & Crew:")
                    .font(.title2)
                    .padding([.horizontal, .top])
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.castAndCrew) { item in
                            CreditItemView(viewModel: CreditViewModel(castOrCrew: item))
                                .frame(width: 150, height: 225)
                        }
                    }
                }
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

//MARK: - Background Image view
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

//MARK: - Movie Label View
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

//MARK: - Movie Info View
struct MovieInfo: View {
    var title: String
    var originalTitle: String
    var genres: String
    var runtime: String
    var budget: String
    var status: String
    var releaseDate: String
    var popularity: String
    var rate: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.title)
                .fontWeight(.medium)
                .lineLimit(3)
                .padding(.top, 12)
                .fixedSize(horizontal: false, vertical: true)
            Text(originalTitle)
                .font(.title3)
                .lineLimit(3)
                .fixedSize(horizontal: false, vertical: true)
            
            Text(genres)
                .font(.body)
                .fontWeight(.light)
                .lineLimit(3)
                .fixedSize(horizontal: false, vertical: true)
            
            HStack(alignment: .top, spacing: 12) {
                VStack(alignment: .leading, spacing: 12) {
                    Text(runtime)
                        .font(.body)
                        .fontWeight(.light)
                        .lineLimit(1)
                    Text(budget)
                        .font(.body)
                        .fontWeight(.light)
                        .lineLimit(1)
                    Text(status)
                        .font(.body)
                        .fontWeight(.light)
                        .lineLimit(1)
                    Text(releaseDate)
                        .font(.body)
                        .fontWeight(.light)
                        .lineLimit(1)
                }
                Spacer()
                VStack(alignment: .leading) {
                    MovieLabel(text: popularity, imageName: "heart.fill")
                    MovieLabel(text: rate, imageName: "star.fill")
                }
            }
            .padding(.top)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MovieDetailView(viewModel: MovieDetailViewModel(idMovie: -1))
        }
    }
}
