//
//  MovieRowView.swift
//  TMDBMovieApp
//
//  Created by mustafaolmezses on 22.12.2025.
//

import SwiftUI
import Kingfisher

struct MovieRowView: View {
    
    @ObservedObject var favoriteVM: FavoritesViewModel
    
    let movie: Movie
    
    var body: some View {
        HStack {
            KFImage(movie.posterURL)
                .placeholder {
                    ProgressView().frame(width: 80, height: 120)
                }
                .onFailure { _ in
                    print("Error MovieRow Async Kingfisher")
                }
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 120)
                .clipped()
            
            VStack(alignment: .leading){
                Text(movie.title)
                    .frame(alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                
                Text(movie.overview)
                    .frame(alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .font(.caption)
                    .lineLimit(3)
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.orange)
                    
                    Text(String(format: "%.1f", movie.voteAverage))
                        .font(.caption)
                }
            }
            Spacer()
            
            Button {
                favoriteVM.toggleFavorite(movie: movie)
            } label: {
                Image(
                    systemName: favoriteVM.isFavorite(movieId: movie.id)
                    ? "heart.fill"
                    : "heart"
                )
                .foregroundStyle(.red)
            }

            
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    let storage = UserDefaultsFavoritesStorage()
    let repository = FavoritesRepository(storage: storage)
    
    MovieRowView(favoriteVM: FavoritesViewModel(repository: repository), movie: Movie(id: 12, title: "Mörümcek Kaıdn", overview: "kadın işte", posterPath: "asd", backdropPath: "wdfs", voteAverage: 3.4))
}
