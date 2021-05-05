//
//  VideoListView.swift
//  PopCorn-SwiftUI
//
//  Created by Valmir Junior on 28/04/21.
//

import SwiftUI

struct VideoListView: View {
    @ObservedObject var viewModel: VideoListViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.movies) { movie in
                NavigationLink(destination: MovieDetailView(viewModel: MovieDetailViewModel(idMovie: movie.id))) {
                    VideoListRow(viewModel: VideoListRowViewModel(movie: movie))
                        .onAppear {
                            loadNextPageIfNeeded(with: movie)
                        }
                }
            }
            .navigationTitle("Movies")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Label("Reload Data", systemImage: "arrow.counterclockwise")
                        .foregroundColor(.accentColor)
                        .onTapGesture {
                            viewModel.fetchData(isToReload: true)
                        }
                }
            }
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
    
    private func loadNextPageIfNeeded(with movie: Movie) {
        var position = viewModel.movies.count - 1
        if viewModel.movies.count > General.offset {
            position = viewModel.movies.count - General.offset
        }
        if movie.id == viewModel.movies[position].id {
            viewModel.fetchData()
        }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        
        VideoListView(viewModel: VideoListViewModel())
    }
}
