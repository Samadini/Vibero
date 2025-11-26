//
//  MovieData.swift
//  IndieFocus
//
//  Created by S.A.N.T.Vilochana on 2025-11-21.
//


import Foundation

struct MovieData {
    static let movies = [
        Movie(
            title: "Big Buck Bunny",
            description: "A giant rabbit with a heart bigger than himself deals with three bullying rodents.",
            imageName: "poster_bunny", // You need an image named this in Assets
            videoURL: URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!
        ),
        Movie(
            title: "Elephant Dream",
            description: "The world's first open movie, made entirely with open source graphics software such as Blender.",
            imageName: "poster_elephant",
            videoURL: URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4")!
        ),
        Movie(
            title: "For Bigger Blazes",
            description: "A look at how HBO uses Google Cloud Platform to handle traffic spikes.",
            imageName: "poster_blazes",
            videoURL: URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4")!
        ),
        Movie(
            title: "Tears of Steel",
            description: "A group of warriors and scientists gather at the 'Oude Kerk' in Amsterdam to stage a crucial event from the past.",
            imageName: "poster_steel",
            videoURL: URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4")!
        )
    ]
}