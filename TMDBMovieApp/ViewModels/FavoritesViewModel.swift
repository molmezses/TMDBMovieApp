//
//  FavoritesViewModel.swift
//  TMDBMovieApp
//
//  Created by mustafaolmezses on 22.12.2025.
//

import Foundation
import Combine

@MainActor
final class FavoritesViewModel: ObservableObject{
    
    /// Neden private(set)?
    ///
    /// çünkü dışarıdan değiştirelemez
    /// sadece viewmodel değiştirir
    /// güvenli
    ///
    
    
    ///Repository şunlarla ilgilenir:
    ///   Favori var mı?
    ///   Varsa çıkar, yoksa ekle
    ///    Aynı film 2 kez eklenmesin
    ///    Storage’a ne zaman kaydedilecek?
    ///
    ///    Veriyi kaydetmek
    ///    Veriyi geri okumak
    ///    Nasıl kaydedildiğini bilir
    ///    *****************
    ///    Storage şunlarla ilgilenir:
    ///    UserDefaults
    ///    CoreData
    @Published  private(set) var favorites: [Movie] = []
    
    private let repository: FavoritesRepository
    
    init(repository: FavoritesRepository) {
        self.repository = repository
    }
    
    func loadFavorites()  {
        favorites = repository.load()
    }
    
    func toggleFavorite(movie: Movie)  {
        repository.toggle(movie: movie, favorites: &favorites)
    }
    
    func isFavorite(movieId: Int) -> Bool {
        repository.isFavorite(movieId: movieId, favorites: favorites)
    }
    
    
    
}


