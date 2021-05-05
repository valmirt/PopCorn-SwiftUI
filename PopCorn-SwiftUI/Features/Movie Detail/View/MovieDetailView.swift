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
                    rate: viewModel.rate,
                    countries: viewModel.countries,
                    companies: viewModel.companies
                )
                .padding(.horizontal)
                
                Spacer()
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
    var countries: String
    var companies: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.title)
                .fontWeight(.medium)
                .lineLimit(3)
                .padding(.top, 12)
            Text(originalTitle)
                .font(.title3)
                .lineLimit(3)
            
            Text(genres)
                .font(.body)
                .fontWeight(.light)
                .lineLimit(3)
            
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
            
            VStack(alignment: .leading, spacing: 12) {
                Text(countries)
                    .font(.body)
                    .fontWeight(.light)
                    .lineLimit(3)
                Text(companies)
                    .font(.body)
                    .fontWeight(.light)
                    .lineLimit(3)
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
