//
//  Movie.swift
//  IndieFocus
//
//  Created by S.A.N.T.Vilochana on 2025-11-21.
//


import Foundation

struct Movie: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let description: String
    let imageName: String // Name of the image in Assets
    let videoURL: URL     // Web link to the video file
}