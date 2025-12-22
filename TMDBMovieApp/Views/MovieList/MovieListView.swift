//
//  MovieListView.swift
//  TMDBMovieApp
//
//  Created by mustafaolmezses on 21.12.2025.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var movieVm: MovieListViewModel
    
    var body: some View {
        
        
    }
}

#Preview {
    MovieListView(movieVm: MovieListViewModel(api: APIService.shared))
}
