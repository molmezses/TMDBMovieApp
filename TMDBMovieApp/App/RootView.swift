//
//  RootView.swift
//  TMDBMovieApp
//
//  Created by mustafaolmezses on 21.12.2025.
//

import SwiftUI

struct RootView: View {
    
    @StateObject var movieVm = MovieListViewModel(api: APIService.shared)
    @StateObject var favoriteVm: FavoritesViewModel
    
    init(){
        let storage = UserDefaultsFavoritesStorage()
        let repository = FavoritesRepository(storage: storage)
        _favoriteVm = StateObject(wrappedValue: FavoritesViewModel(repository: repository))
    }
    
    var body: some View {
        TabView {
            MovieListView(movieVm: movieVm, favoriteVm: favoriteVm)
                .tabItem {
                    Label("Movies", systemImage: "film")
                }
        }
    }
}

#Preview {
    RootView()
}
