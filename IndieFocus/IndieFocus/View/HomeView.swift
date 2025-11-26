//
//  HomeView.swift
//  IndieFocus
//
//  Created by S.A.N.T.Vilochana on 2025-11-21.
//

import SwiftUI

struct HomeView: View {
    // Select the first movie as our "Featured" movie
    let featuredMovie = MovieData.movies.first!
    let allMovies = MovieData.movies

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 40) {
                    
                    // 1. HERO SECTION (Big Featured Movie)
                    VStack(alignment: .leading, spacing: 20) {
                        Image(featuredMovie.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 500)
                            .clipped() // Cut off extra parts
                            .overlay(
                                LinearGradient(
                                    colors: [Color.black.opacity(0.0), Color.black.opacity(0.6), Color.black.opacity(0.95)],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .overlay(alignment: .bottomLeading) {
                                VStack(alignment: .leading, spacing: 12) {
                                    Text("Featured Film")
                                        .font(.headline)
                                        .foregroundColor(.white.opacity(0.8))
                                    
                                    Text(featuredMovie.title)
                                        .font(.system(size: 48, weight: .bold))
                                        .foregroundColor(.white)
                                        .lineLimit(2)
                                        .minimumScaleFactor(0.7)
                                    
                                    Text(featuredMovie.description)
                                        .font(.title3)
                                        .foregroundColor(.white.opacity(0.9))
                                        .lineLimit(2)
                                        .frame(maxWidth: 900, alignment: .leading)
                                    
                                    NavigationLink(destination: MovieDetailView(movie: featuredMovie)) {
                                        HStack(spacing: 10) {
                                            Image(systemName: "play.fill")
                                            Text("Play Now")
                                                .fontWeight(.semibold)
                                        }
                                        .padding(.horizontal, 22)
                                        .padding(.vertical, 12)
                                        .background(
                                            LinearGradient(colors: [Color.red, Color.pink], startPoint: .leading, endPoint: .trailing)
                                        )
                                        .foregroundColor(.white)
                                        .clipShape(Capsule())
                                        .shadow(color: .red.opacity(0.4), radius: 10, x: 0, y: 8)
                                    }
                                    .buttonStyle(.plain)
                                }
                                .padding(.horizontal, 60)
                                .padding(.bottom, 28)
                            }
                    }
                    
                    // 2. ROW SECTION (Trending Now)
                    VStack(alignment: .leading) {
                        Text("Trending Now")
                            .font(.title)
                            .bold()
                            .padding(.leading, 60)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 40) {
                                ForEach(allMovies) { movie in
                                    NavigationLink(destination: MovieDetailView(movie: movie)) {
                                        PosterCard(movie: movie)
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                            .padding(.horizontal, 60)
                            .padding(.bottom, 50)
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.top) // Let image go to very top
            .background(Color.black)
            .preferredColorScheme(.dark)
        }
    }
}

struct PosterCard: View {
    let movie: Movie
    @State private var isPressed: Bool = false
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(movie.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 350, height: 500)
                .clipped()
                .overlay(
                    LinearGradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.85)], startPoint: .top, endPoint: .bottom)
                )
            VStack(alignment: .leading, spacing: 6) {
                Text(movie.title)
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .padding(16)
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white.opacity(0.0001))
        )
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: .black.opacity(0.5), radius: 18, x: 0, y: 14)
        .scaleEffect(isPressed ? 0.97 : 1)
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isPressed)
        .onLongPressGesture(minimumDuration: 0.01, pressing: { pressing in
            isPressed = pressing
        }, perform: {})
    }
}