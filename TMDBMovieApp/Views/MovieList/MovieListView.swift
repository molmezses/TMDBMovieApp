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
            LazyVStack(spacing: 20) {

                ForEach(movies.indices, id: \.self) { index in
                    let movie = movies[index]

                    NavigationLink {
                        MovieDetailView(movie: movie, favoriteVm: favoriteVm)
                    } label: {
                        MovieRowView(
                            favoriteVM: favoriteVm,
                            movie: movie
                        )
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(.systemBackground))
                                .shadow(
                                    color: .black.opacity(0.08),
                                    radius: 8,
                                    x: 0,
                                    y: 4
                                )
                        )
                    }
                    .buttonStyle(.plain) 
                    .padding(.horizontal)
                    .onAppear {
                        if index == movies.count - 5 {
                            Task {
                                await movieVm.fetchMovies()
                            }
                        }
                    }
                }

                if movieVm.isLoadingNextPage {
                    ProgressView()
                        .padding(.vertical, 24)
                }
            }
            .padding(.top, 12)
        }
    }
}

#Preview {
    let storage = UserDefaultsFavoritesStorage()
    let repository = FavoritesRepository(storage: storage)
    
    MovieListView(movieVm: MovieListViewModel(api: APIService.shared), favoriteVm: FavoritesViewModel(repository: repository))
}
