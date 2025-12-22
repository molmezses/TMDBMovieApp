//
//  FavoritesStorage.swift
//  TMDBMovieApp
//
//  Created by mustafaolmezses on 22.12.2025.
//

import Foundation

protocol FavoritesStorage{
    func load() -> [Movie]
    func save(_ movies: [Movie])
}
