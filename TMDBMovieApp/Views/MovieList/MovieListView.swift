//
//  MovieListView.swift
//  TMDBMovieApp
//
//  Created by mustafaolmezses on 21.12.2025.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var movieVm: MovieListViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
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
                    NavigationLink {
                        
                    } label: {
                        
                    }
                    .onAppear {
                        if index == movies.count - 5 {
                            Task {
                                await movieVm.fetchMovies()
                            }
                        }
                    }

                }
            }
            .padding()
        }
    }
}

#Preview {
    MovieListView(movieVm: MovieListViewModel(api: APIService.shared))
}
