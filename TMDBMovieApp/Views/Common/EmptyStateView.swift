//
//  EmptyStateView.swift
//  TMDBMovieApp
//
//  Created by mustafaolmezses on 22.12.2025.
//

import SwiftUI

struct EmptyStateView: View {
    
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(spacing: 12){
            Image(systemName: "film")
                .font(.system(size: 48))
                .foregroundStyle(.secondary)
            
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(subtitle)
                .font(.body)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    EmptyStateView(title: "No movies", subtitle: "No movies dound please try again later")
}
