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
    
    @Published private(set) var isLoadingNextPage: Bool = false
    
    //MARK: - CACHE(POPULAR MOVIES)
    private var cachedPopularMovies: [Movie] = []
//    private var cachedPopularPage: Int = 1
//    private var cachedPopularTotalPage: Int = 1
    

    //MARK: -DEPENDENCIES
    ///dependency -> bagımlılık
    /// Bu sınıfın çalışabilmesi için bagımlı olduğu başka şeyler var
    
    ///api : MovieAPIProtocol yazarak test işlemlerinde kullılabilr ve direk api = APIService.shared deseydik viewmodele kitlenecekti değiştirmek zor olaaktı
    private let api: MovieAPIProtocol
    
    ///böyle yaparak viewmodelin gerek duyduğu denependency i inital ederken alabilyorsun
    ///ileride -> MovieListViewModel(api: MovieApi()) diyerek vereiltsin
    ///
    /// DEPENDENCY INJECTİON
    /// test yazabilirm
    /// mock data verebiliirm
    /// service seğişirse viewModel değişmeisne gerek yok 
    init(api: MovieAPIProtocol) {
        self.api = api
    }
    
    func fetchMovies(reset: Bool = false) async {
        if reset {
            currentPage = 1
            totalPage = 1
            state = .loading
            cachedPopularMovies = []
        }
        
        guard currentPage <= totalPage else { return }
        
        //zaten yeni sayfa yükleniyor ise devam etme
        //aynı anda iki istek atmaması için 
        guard !isLoadingNextPage else { return }
        
        //ilk yüklemede footer göstermemesi için
        if currentPage > 1 {
            isLoadingNextPage = true
        }
        
        do{
            let response: MovieResponse
            
            response = try await api.fetchPopularMovies(page: currentPage)

            cachedPopularMovies.append(contentsOf: response.results)
            totalPage = response.totalPages
            currentPage += 1
            
            state = cachedPopularMovies.isEmpty
            ? .empty
            : .success(cachedPopularMovies)

        }catch{
            state = .error("Something went wrong. Please try again.")
        }
        
        //istek bitince spinner kapanır
        isLoadingNextPage = false
    }
    
    
    
    
    
    
    
    
    
}
