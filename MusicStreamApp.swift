import SwiftUI

@main
struct MusicStreamApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)
            
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(1)
            
            LibraryView()
                .tabItem {
                    Label("Library", systemImage: "music.note.list")
                }
                .tag(2)
        }
        .accentColor(.green)
    }
}

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 0.1, green: 0.1, blue: 0.15),
                        Color(red: 0.05, green: 0.05, blue: 0.1)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        // Header
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Good Evening")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.white)
                            
                            Text("Welcome to SoundWave")
                                .font(.system(size: 14, weight: .regular))
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal)
                        .padding(.top, 16)
                        
                        // Featured Playlists
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Featured Playlists")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.white)
                                .padding(.horizontal)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 12) {
                                    ForEach(0..<5, id: \.self) { index in
                                        PlaylistCard(
                                            title: ["Chill Vibes", "Workout Mix", "Party Hits", "Focus Music", "Sleep Sounds"][index],
                                            image: ["🎵", "💪", "🎉", "🧠", "😴"][index],
                                            color: [Color.blue, Color.red, Color.orange, Color.purple, Color.cyan][index]
                                        )
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        
                        // Recently Played
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Recently Played")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.white)
                                .padding(.horizontal)
                            
                            VStack(spacing: 8) {
                                ForEach(0..<4, id: \.self) { index in
                                    SongRow(
                                        title: ["Midnight Dreams", "Electric Soul", "Ocean Waves", "Starlight"][index],
                                        artist: ["Artist \(index + 1)", "Artist \(index + 2)", "Artist \(index + 3)", "Artist \(index + 4)"][index],
                                        emoji: ["🌙", "⚡", "🌊", "⭐"][index]
                                    )
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        // New Releases
                        VStack(alignment: .leading, spacing: 12) {
                            Text("New Releases")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.white)
                                .padding(.horizontal)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 12) {
                                    ForEach(0..<4, id: \.self) { index in
                                        AlbumCard(
                                            title: ["Summer Hits", "Winter Nights", "Spring Love", "Fall Breeze"][index],
                                            artist: ["Various Artists", "Top Hits", "Chart Toppers", "Trending Now"][index],
                                            emoji: ["☀️", "❄️", "🌸", "🍂"][index]
                                        )
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        
                        Spacer(minLength: 20)
                    }
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct SearchView: View {
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.1, green: 0.1, blue: 0.15),
                    Color(red: 0.05, green: 0.05, blue: 0.1)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    TextField("Search songs, artists...", text: $searchText)
                        .foregroundColor(.white)
                        .textFieldStyle(.plain)
                    
                    if !searchText.isEmpty {
                        Button(action: { searchText = "" }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(12)
                .background(Color(red: 0.2, green: 0.2, blue: 0.25))
                .cornerRadius(24)
                .padding()
                
                if searchText.isEmpty {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Browse All")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        
                        VStack(spacing: 12) {
                            ForEach(["Pop", "Rock", "Hip-Hop", "Electronic", "Jazz", "Classical"], id: \.self) { genre in
                                HStack {
                                    Text(genre)
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                }
                                .padding(12)
                                .background(Color(red: 0.2, green: 0.2, blue: 0.25))
                                .cornerRadius(8)
                            }
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                    .padding(.top, 20)
                } else {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Results for '\(searchText)'")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                        
                        VStack(spacing: 8) {
                            ForEach(0..<5, id: \.self) { index in
                                SongRow(
                                    title: "Song \(index + 1)",
                                    artist: "Artist Name",
                                    emoji: "🎵"
                                )
                            }
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                    .padding(.top, 20)
                }
            }
        }
    }
}

struct LibraryView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.1, green: 0.1, blue: 0.15),
                    Color(red: 0.05, green: 0.05, blue: 0.1)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Your Library")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.top, 16)
                
                VStack(spacing: 12) {
                    LibraryItem(title: "Liked Songs", count: "142 songs", emoji: "❤️")
                    LibraryItem(title: "Downloaded", count: "34 songs", emoji: "⬇️")
                    LibraryItem(title: "My Playlists", count: "8 playlists", emoji: "📋")
                    LibraryItem(title: "Following", count: "23 artists", emoji: "👥")
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

struct PlaylistCard: View {
    let title: String
    let image: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(color.opacity(0.3))
                
                Text(image)
                    .font(.system(size: 48))
            }
            .frame(height: 120)
            
            Text(title)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.white)
                .lineLimit(2)
        }
        .frame(width: 140)
        .padding(12)
        .background(Color(red: 0.15, green: 0.15, blue: 0.2))
        .cornerRadius(12)
    }
}

struct AlbumCard: View {
    let title: String
    let artist: String
    let emoji: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [Color.green.opacity(0.3), Color.blue.opacity(0.3)]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
                
                Text(emoji)
                    .font(.system(size: 48))
            }
            .frame(height: 140)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                    .lineLimit(2)
                
                Text(artist)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
        }
        .frame(width: 150)
        .padding(12)
        .background(Color(red: 0.15, green: 0.15, blue: 0.2))
        .cornerRadius(12)
    }
}

struct SongRow: View {
    let title: String
    let artist: String
    let emoji: String
    
    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.green.opacity(0.2))
                
                Text(emoji)
                    .font(.system(size: 24))
            }
            .frame(width: 50, height: 50)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                
                Text(artist)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Image(systemName: "ellipsis")
                .foregroundColor(.gray)
        }
        .padding(12)
        .background(Color(red: 0.15, green: 0.15, blue: 0.2))
        .cornerRadius(8)
    }
}

struct LibraryItem: View {
    let title: String
    let count: String
    let emoji: String
    
    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.green.opacity(0.3))
                
                Text(emoji)
                    .font(.system(size: 24))
            }
            .frame(width: 50, height: 50)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                
                Text(count)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(12)
        .background(Color(red: 0.15, green: 0.15, blue: 0.2))
        .cornerRadius(8)
    }
}

#Preview {
    ContentView()
}
