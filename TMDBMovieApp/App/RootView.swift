//
//  RootView.swift
//  TMDBMovieApp
//
//  Created by mustafaolmezses on 21.12.2025.
//

import SwiftUI

struct RootView: View {
    
    @StateObject var movieVm = MovieListViewModel()
    
    var body: some View {
        TabView {
            MovieListView()
                .tabItem {
                    Label("Movies", systemImage: "film")
                }
        }
    }
}

#Preview {
    RootView()
}
