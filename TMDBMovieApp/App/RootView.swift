//
//  RootView.swift
//  TMDBMovieApp
//
//  Created by mustafaolmezses on 21.12.2025.
//

import SwiftUI

struct RootView: View {
    
    @StateObject var movieVm = MovieListViewModel(api: APIService.shared)

    var body: some View {
        TabView {
            MovieListView(movieVm: movieVm)
                .tabItem {
                    Label("Movies", systemImage: "film")
                }
        }
    }
}

#Preview {
    RootView()
}
