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
            List(0..<10) { item in
                NavigationLink(destination: MovieDetailView()) {
                    VideoListRow(viewModel: VideoListRowViewModel(movie: Preview.movie))
                }
            }
            .navigationTitle("Movies")
        }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        
        VideoListView(viewModel: VideoListViewModel())
    }
}
