//
//  MovieListView.swift
//  TMDBMovieApp
//
//  Created by mustafaolmezses on 21.12.2025.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var movieVm: MovieListViewModel
    @ObservedObject var favoriteVm : FavoritesViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                content
            }
            .navigationTitle("Popular Movies")
            .refreshable {
                await movieVm.fetchMovies(reset: true)
            }
        }
        .task {
            await movieVm.fetchMovies()
        }
    }
    
    @ViewBuilder
    private var content: some View{
        switch movieVm.state {
        case .idle , .loading:
            ProgressView()
                .padding(.top , 80)
        
        case .empty:
            EmptyStateView(
                title: "No Movies",
                subtitle: "Please try again later"
            )
        case .error(let message):
            VStack(spacing: 12){
                Text(message)
                Button("Retry") {
                    Task{
                        await movieVm.fetchMovies(reset: true)
                    }
                }
            }
        case .success(let movies):
            LazyVStack(spacing: 16){
                ForEach(movies.indices , id: \.self) { index in
                    
                    let movie = movies[index]
                    NavigationLink {
                        
                    } label: {
                        MovieRowView(favoriteVM: favoriteVm, movie: movie)
                            .foregroundStyle(.black)
                    }
                    .onAppear {
                        if index == movies.count - 5 {
                            Task {
                                await movieVm.fetchMovies()
                            }
                        }
                    }

                }
                
                if movieVm.isLoadingNextPage{
                    ProgressView()
                        .padding(.trailing , 24)
                }
            }
            .padding()
        }
    }
}

#Preview {
    let storage = UserDefaultsFavoritesStorage()
    let repository = FavoritesRepository(storage: storage)
    
    MovieListView(movieVm: MovieListViewModel(api: APIService.shared), favoriteVm: FavoritesViewModel(repository: repository))
}
