//
//  MovieDetailView.swift
//  TMDBMovieApp
//
//  Created by mustafaolmezses on 23.12.2025.
//

import SwiftUI
import Kingfisher

struct MovieDetailView: View {

    let movie: Movie
    @ObservedObject var favoriteVM: FavoritesViewModel

    init(movie: Movie, favoriteVm: FavoritesViewModel) {
        self.movie = movie
        self.favoriteVM = favoriteVm
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                header
                content
            }
            .frame(maxWidth: .infinity)
        }
        .background(Color.black)
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .top)
    }

    // MARK: Header
    private var header: some View {
        ZStack(alignment: .topTrailing) {

            KFImage(movie.backdropURL)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 340)
                .clipped()

            LinearGradient(
                colors: [.clear, .black.opacity(0.4), .black],
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(width: UIScreen.main.bounds.width, height: 340)

            Button {
                favoriteVM.toggleFavorite(movie: movie)
            } label: {
                Image(systemName: favoriteVM.isFavorite(movieId: movie.id) ? "heart.fill" : "heart")
                    .foregroundStyle(.red)
                    .padding(10)
                    .background(.black.opacity(0.6))
                    .clipShape(Circle())
            }
            .padding()
        }
    }

    // MARK: Content
    private var content: some View {
        VStack(alignment: .leading, spacing: 24) {

            HStack(alignment: .top, spacing: 16) {

                KFImage(movie.posterURL)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 130, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .shadow(radius: 6)

                VStack(alignment: .leading, spacing: 16) {

                    Text(movie.title)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)

                    HStack(spacing: 8) {
                        InfoChip(text: "Bilim Kurgu")
                        InfoChip(text: "2023")
                    }

                    HStack(spacing: 6) {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)

                        Text(String(format: "%.1f", movie.voteAverage))
                            .foregroundStyle(.yellow)
                    }
                    
                    Button {
                        favoriteVM.toggleFavorite(movie: movie)
                    } label: {
                        Image(
                            systemName: favoriteVM.isFavorite(movieId: movie.id)
                            ? "heart.fill"
                            : "heart"
                        )
                        .foregroundStyle(.red)
                        .font(.title)
                    }
                }

                Spacer()
            }

            Divider()
                .background(Color.white.opacity(0.2))

            VStack(alignment: .leading, spacing: 8) {
                Text("Overview")
                    .font(.headline)
                    .foregroundStyle(.white)

                Text(movie.overview)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .lineSpacing(4)
            }
        }
        .padding()
        .padding(.top, -140) 
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: InfoChip
struct InfoChip: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.caption)
            .foregroundStyle(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(Color.white.opacity(0.15))
            .clipShape(Capsule())
    }
}

    
    #Preview {
        let movie: Movie = Movie(
            id: 12,
            title: "sdfjhksdf",
            overview: "sdjklhf sdkhjlf s lsjkdhf sdljkhf sdlkjhf hjklsdflkhj ",
            posterPath:"    https://image.tmdb.org/t/p/w500/d5NXSklXo0qyIYkgV94XAgMIckC.jpg",
            backdropPath: "https://image.tmdb.org/t/p/w780/iopYFB1b6Bh7FWZh3onQhph1sih.jpg",
            voteAverage: 2.4
        )
        
        let storage = UserDefaultsFavoritesStorage()
        let repository = FavoritesRepository(storage: storage)
        let favoriteVm = FavoritesViewModel(repository: repository)
        
        MovieDetailView(movie: movie, favoriteVm: favoriteVm)
    }
    
    
    
