# SoundWave - Music Streaming App

A modern Spotify-like music streaming application built with SwiftUI for iOS.

## Features

- **Home Tab**: Browse featured playlists, recently played songs, and new releases
- **Search Tab**: Search for songs, artists, and browse music genres
- **Library Tab**: Access your liked songs, downloaded tracks, playlists, and followed artists
- **Modern Dark UI**: Beautiful gradient backgrounds with green accent colors (Spotify-inspired)
- **Responsive Design**: Works seamlessly on all iOS devices

## App Structure

### Main Components

1. **ContentView**: Tab-based navigation with three main sections
2. **HomeView**: Displays featured content and recommendations
3. **SearchView**: Search functionality with genre browsing
4. **LibraryView**: User's music library and collections

### UI Components

- **PlaylistCard**: Horizontal scrollable playlist cards
- **AlbumCard**: Album display with emoji artwork
- **SongRow**: Individual song listing with artist info
- **LibraryItem**: Library section items with counts

## Customization

### Change App Name
To change the app name from "SoundWave" to your preferred name:
1. Open the file in Xcode
2. Find the text "SoundWave" in the HomeView
3. Replace with your desired app name

### Change Background Images
The app uses gradient backgrounds. To customize:
- Modify the `LinearGradient` colors in each View
- Current colors: Dark blue/purple gradient
- Change the RGB values in `Color(red:, green:, blue:)` to your preference

### Change Accent Color
The app uses green as the accent color (Spotify-style). To change:
- Find `.accentColor(.green)` in ContentView
- Replace `.green` with `.blue`, `.red`, `.purple`, etc.

## Requirements

- iOS 15.0+
- Xcode 13.0+
- Swift 5.5+

## Installation

1. Copy `MusicStreamApp.swift` to your Xcode project
2. Build and run on iOS simulator or device
3. The app will display with sample data

## Future Enhancements

- Real music API integration (Spotify API, Apple Music)
- Audio player functionality
- User authentication
- Playlist creation and management
- Social features (sharing, following artists)
- Offline download support
