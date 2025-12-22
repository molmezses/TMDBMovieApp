//
//  APIService.swift
//  TMDBMovieApp
//
//  Created by mustafaolmezses on 22.12.2025.
//

import Foundation


//final? neden -> SubClass Edilmesin -> Daha güvenli ve performans
final class APIService: MovieAPIProtocol{
    
    static let shared = APIService()
    
    private init(){
        
    }
    
        ///async -> zaman alabilir
        ///throws -> hata fırlatabilir
        ///MovieRespoınse -> fonksiyon geriye MovieResponse döndürecek
    ///
    func fetchPopularMovies(page: Int) async throws -> MovieResponse{
        
        let urlString = "\(APIConstants.basedUrl)/movie/popular?api_key=\(APIConstants.apiKey)&page=\(page)"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        /// URLSession sana tuple veri tipi dönderir (data , response)
        /// data : ham veri
        /// respınse : sunucnun cevabı
        /// response -> 200 404 gibi status codelar ile hata olup olmadığını veya rate limit
        
        let (data , response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse  = response as? HTTPURLResponse , httpResponse.statusCode == 200 else{
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(MovieResponse.self, from: data)
        
    }
    
    
    
}
