//
//  HomeView.swift
//  PopCorn-SwiftUI
//
//  Created by Valmir Junior on 04/06/21.
//

import SwiftUI

struct HomeView: View {
    
    @State private var selection: Tab = .popular
    
    var body: some View {
        TabView(selection: $selection) {
            VideoListView(viewModel: VideoListViewModel(tab: Tab.popular))
                .tabItem {
                    Label(
                        title: { Text(Tab.popular.rawValue) },
                        icon: { Tab.popular.icon }
                    )
                }
                .tag(Tab.popular)
            VideoListView(viewModel: VideoListViewModel(tab: Tab.nowPlaying))
                .tabItem {
                    Label(
                        title: { Text(Tab.nowPlaying.rawValue) },
                        icon: { Tab.nowPlaying.icon }
                    )
                }
                .tag(Tab.nowPlaying)
            VideoListView(viewModel: VideoListViewModel(tab: Tab.topRated))
                .tabItem {
                    Label(
                        title: { Text(Tab.topRated.rawValue) },
                        icon: { Tab.topRated.icon }
                    )
                }
                .tag(Tab.topRated)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
