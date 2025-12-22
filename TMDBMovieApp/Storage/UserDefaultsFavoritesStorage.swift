//
//  UserDefaultsFavoritesStorage.swift
//  TMDBMovieApp
//
//  Created by mustafaolmezses on 22.12.2025.
//

import Foundation

final class UserDefaultsFavoritesStorage : FavoritesStorage{
    
    private let key = "favorite_movie"
    
    func load() -> [Movie] {
        guard
            let data = UserDefaults.standard.data(forKey: key) ,
            let movies = try? JSONDecoder().decode([Movie].self, from: data)
        else { return []}
        
        return movies
    }
    
    func save(_ movies: [Movie]) {
        guard let data = try? JSONEncoder().encode(movies) else {return}
        UserDefaults.standard.set(data, forKey: key)
    }
    
    
    
    
}
