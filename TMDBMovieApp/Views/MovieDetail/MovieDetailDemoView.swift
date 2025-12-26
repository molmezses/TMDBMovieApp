import SwiftUI

struct MovieDetailDemoView: View {
    
    private let backdropURL = URL(string: "https://image.tmdb.org/t/p/w780/iopYFB1b6Bh7FWZh3onQhph1sih.jpg")
    private let posterURL   = URL(string: "https://image.tmdb.org/t/p/w500/d5NXSklXo0qyIYkgV94XAgMIckC.jpg")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                contentSection
                
            }
        }
        .background(Color.black)
        .ignoresSafeArea(edges: .top)
    }
    
    // MARK: - Content
    private var contentSection: some View {
        VStack {
            ZStack(alignment: .bottom) {
                
                AsyncImage(url: backdropURL) { image in
                    image
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .frame(height: 360)
                        .clipped()
                } placeholder: {
                    Color.black
                }
                
                LinearGradient(
                    colors: [
                        Color.black.opacity(0.0),
                        Color.black.opacity(0.4),
                        Color.black.opacity(0.7),
                        Color.black
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: 360)
                
                
            }
            
            VStack {
                HStack {
                    AsyncImage(url: posterURL) { image in
                        image
                            .resizable()
                            .frame(width: 140, height: 220, alignment: .leading)
                            .clipped()
                    } placeholder: {
                        Color.black
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 12){
                        HStack {
                            Text("Batman 3: yeto")
                                .foregroundStyle(.white)
                                .font(.title)
                                .bold()

                            Spacer()
                        }
                        
                        
                        
                        HStack {
                            Text("Bilim Kurgu")
                                .font(.body)
                                .foregroundStyle(.gray)
                            Spacer()
                        }
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                                .imageScale(.large)
                            Text("5.9")
                                .font(.body)
                                .foregroundStyle(.yellow)
                            Spacer()
                        }
                        
                        HStack {
                            Text("2023")
                                .font(.caption)
                                .foregroundStyle(.gray)
                            Spacer()
                        }
                    }
                    .frame(maxWidth: .infinity , alignment: .leading)
                }
                
                HStack {
                    Text("Overview")
                        .font(.title)
                        .foregroundStyle(.white)
                    Spacer()
                }
                    
                Text("A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.Humanity is facing extinction and the journey will test their limits beyond imagination.")
                .font(.headline)
                .foregroundColor(.gray)
                .lineSpacing(4)
            }
            .padding(.horizontal)
            .offset(y: -126)

        }
    }    
    
}

#Preview {
    MovieDetailDemoView()
}
