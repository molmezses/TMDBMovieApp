//
//  MovieListViewModel.swift
//  TMDBMovieApp
//
//  Created by mustafaolmezses on 21.12.2025.
//

import Foundation
import Combine

///MainActor ?
///ana threadde uı güncellenmesi için öncelik bunu koymazsak app bazen çöker UI güncellenmeyebilir
///
///Final?
///classtan alt child classlar oluşsuturlmamsı için -> derlenirken zaman kazanma proje şişmez
@MainActor
final class MovieListViewModel: ObservableObject {
    
    //MARK: -UI STATE
    ///private(set) -> sadece viewmodel içinden set edilebilir harici yerlerden sadece get işlemi yapılabilir
    @Published private(set) var state: ViewState<[Movie]> = .idle
    
    //MARK: -PAGINATION
    private var currentPage: Int = 1
    private var totalPage: Int = 1
    
    //MARK: - CACHE(POPULAR MOVIES)
    private var cachedPopularMovies: [Movie] = []
    private var cachedPopularPage: Int = 1
    private var cachedPopularTotalPage: Int = 1
    
    //MARK: -DEPENDENCIES
    ///dependency -> bagımlılık
    /// Bu sınıfın çalışabilmesi için bagımlı olduğu başka şeyler var
    
    
    
    
    
    
    
    
    
}
