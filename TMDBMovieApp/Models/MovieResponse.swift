//
//  MovieResponse.swift
//  TMDBMovieApp
//
//  Created by mustafaolmezses on 22.12.2025.
//



/// ENDPOİNT RESULT ->
///
// "page": 1,
//"results": [
//  {
//    "adult": false,
//    "backdrop_path": "/gMJngTNfaqCSCqGD4y8lVMZXKDn.jpg",
//    "genre_ids": [
//      28,
//      12,
//      878
//    ],
//    "id": 640146,
//    "original_language": "en",
//    "original_title": "Ant-Man and the Wasp: Quantumania",
//    "overview": "Super-Hero partners Scott Lang and Hope van Dyne, along with with Hope's parents Janet van Dyne and Hank Pym, and Scott's daughter Cassie Lang, find themselves exploring the Quantum Realm, interacting with strange new creatures and embarking on an adventure that will push them beyond the limits of what they thought possible.",
//    "popularity": 8567.865,
//    "poster_path": "/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg",
//    "release_date": "2023-02-15",
//    "title": "Ant-Man and the Wasp: Quantumania",
//    "video": false,
//    "vote_average": 6.5,
//    "vote_count": 1886
//  },
//  ....
//],
//  "total_pages": 38029,
//  "total_results": 760569

/// endpoint sana  sunduğu şeyler
/// page -> Int
/// results -> birden  fazla cevap o yüzden [your_model]
/// total_pages -> Int
/// total_results -> Int
///
/// hesini kullanmak zorında değilsin bu örnekte total_results kullanılmadığı için Resposa yazılmadı
///
/// ** Coding keyslere dikkat et
///
import Foundation

struct MovieResponse: Codable {
    let page: Int
    let results: [Movie]
    let totalPages: Int
    
    enum CodingKeys: String , CodingKey {
        case page
        case results
        case totalPages = "total_pages"
    }
    
    //totalResults şimdilik ihityacımız olmadığı için kullanınlmadı
    
    
    
}
