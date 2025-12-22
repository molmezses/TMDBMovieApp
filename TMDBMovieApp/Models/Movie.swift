//
//  Movie.swift
//  TMDBMovieApp
//
//  Created by mustafaolmezses on 22.12.2025.
//

import Foundation

struct Movie: Codable , Identifiable {
    
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let backdropPath: String?
    let voteAverage: Double
    
    enum CodingKeys: String , CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case voteAverage = "vote_average"
    }
    
}

extension Movie{
    var posterURL: URL?{
        if let posterPath = posterPath{
            return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
        }
        return nil
    }
    
    var backdropURL: URL?{
        if let backdropPath = backdropPath{
            return URL(string: "https://image.tmdb.org/t/p/w780\(backdropPath)")
        }
        return nil
    }
}


