//
//  FavoritesRepository.swift
//  TMDBMovieApp
//
//  Created by mustafaolmezses on 22.12.2025.
//

import Foundation

final class FavoritesRepository{
    
    // Dependency Inversion Principle (SOLID)
    
    // Repository, iş mantığını (business logic) yönetir.
    // Favori ekleme / çıkarma kararları burada verilir.
    // Verinin NEREYE kaydedildiğiyle ilgilenmez.
    
    // Repository, veriyi saklayan yapıyı dışarıdan alır.
    // Böylece UserDefaults, CoreData, File vs. arasında
    // değişiklik yapmak kolay olur ileride değiştireceksen değiştirebilirsin

    private let storage: FavoritesStorage
    
    init(storage: FavoritesStorage) {
        self.storage = storage
    }
    
    /// toggle -> Varsa çıkar yoksa ekle
    
    
    //INOUIT ?
    
//    “favorites dizisini fonksiyon içinde değiştiriyorum
//    ve bu değişiklik dışarıda da geçerli olsun”
//    yoksa bu favorştes dizisi sadece burda değiştirelecek
    // &favorites = bu diziyi yerinde dğeiştir
    func toggle(movie: Movie , favorites: inout [Movie]) {
        
        //if (içi) -> favorites içerisinde movie.id ile eşleşen kayıt var mı ?
        if favorites.contains(where: {$0.id == movie.id}){
            //varsa favoritesten o id ile eşleşen her şeyi kaldır (birden falza olma ihitmlainekkarşı )
            favorites.removeAll{ $0.id == movie.id}
        }else{
            //yoksa ekle
            favorites.append(movie)
        }
        
        ///Bu satır şunu yapar:
///        “Favoriler değişti, şimdi bunu KAYDET”
///        Ama nereye kaydedildiğini repository bilmiyor.
///        UserDefaults olabilir
///        File olabilir
///        Yarın CoreData olabilir
///        Repository’nin umurunda değil.
        storage.save(favorites)
    }
    
    func isFavorite(movieId: Int, favorites: [Movie]) -> Bool {
        favorites.contains {$0.id == movieId}
    }
    
    func load() -> [Movie]{
        storage.load()
    }
    
}
