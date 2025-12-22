//
//  MovieAPIProtocol.swift
//  TMDBMovieApp
//
//  Created by mustafaolmezses on 22.12.2025.
//

import Foundation


/// Protocol -> Kurallar gibi düşün xxxxx: protocol -> o protocola uyan şeyleri kullnamak ve buludnurmak zorunda
protocol MovieAPIProtocol{
    
    func fetchPopularMovies(page: Int) async throws -> MovieResponse
    
    
}
