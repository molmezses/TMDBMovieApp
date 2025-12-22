//
//  ViewState.swift
//  TMDBMovieApp
//
//  Created by mustafaolmezses on 21.12.2025.
//

import Foundation


/// Enumın tipini belirli verseydik sadece o tip için çalışacaktı <T> diyerek her veri tipi için çalışmasını sağılıyoruz
///
/// Tek enum her ekran için Reusable
/// reusable -> tekrardan kullanılabilirlik
enum ViewState<T>{
    case idle // başlangıç durumu -> sayfa açıldı
    case loading
    case success(T)
    case empty
    case error(String)
}
