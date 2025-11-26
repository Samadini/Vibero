//
//  MovieDetailView.swift
//  IndieFocus
//
//  Created by S.A.N.T.Vilochana on 2025-11-21.
//

import SwiftUI
import AVKit // Required for video

struct MovieDetailView: View {
    let movie: Movie

    var body: some View {
        HStack(spacing: 50) {
            // Left: Poster Image
            Image(movie.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 500)
                .cornerRadius(24)
                .shadow(color: .black.opacity(0.6), radius: 30, x: 0, y: 20)

            // Right: Info & Player
            VStack(alignment: .leading, spacing: 24) {
                Text(movie.title)
                    .font(.system(size: 56, weight: .bold))
                    .foregroundColor(.white)
                
                Text(movie.description)
                    .font(.title3)
                    .foregroundColor(.white.opacity(0.85))
                    .lineLimit(3)
                
                HStack(spacing: 16) {
                    Button(action: {}) {
                        HStack(spacing: 10) {
                            Image(systemName: "play.fill")
                            Text("Play")
                                .fontWeight(.semibold)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(
                            LinearGradient(colors: [Color.red, Color.pink], startPoint: .leading, endPoint: .trailing)
                        )
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .shadow(color: .red.opacity(0.4), radius: 10, x: 0, y: 8)
                    }
                    .buttonStyle(.plain)
                    
                    Button(action: {}) {
                        HStack(spacing: 8) {
                            Image(systemName: "plus")
                            Text("My List")
                                .fontWeight(.semibold)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(Color.white.opacity(0.12))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .overlay(
                            Capsule().stroke(Color.white.opacity(0.25), lineWidth: 1)
                        )
                    }
                    .buttonStyle(.plain)
                }
                
                // The Video Player
                // In tvOS, this creates a fully functional player automatically
                VideoPlayer(player: AVPlayer(url: movie.videoURL))
                    .frame(height: 400)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .stroke(Color.white.opacity(0.2), lineWidth: 1)
                    )
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(28)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 28, style: .continuous)
                    .stroke(Color.white.opacity(0.15), lineWidth: 1)
            )
            .shadow(color: .black.opacity(0.5), radius: 30, x: 0, y: 20)
        }
        .padding(50)
        .background(
            ZStack {
                Image(movie.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .blur(radius: 50)
                    .opacity(0.35)
                LinearGradient(colors: [Color.black, Color.black.opacity(0.6)], startPoint: .top, endPoint: .bottom)
            }
            .edgesIgnoringSafeArea(.all)
        )
        .preferredColorScheme(.dark)
        .background(Color.black)
    }
}