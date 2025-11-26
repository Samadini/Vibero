# IndieFocus

A SwiftUI tvOS app inspired by Netflix. It features a cinematic hero section, trending carousels with polished poster cards, and a refined movie detail screen with glass effect and gradient accents.

## Features
- Cinematic hero with overlaid title, description, and Play CTA
- Trending row with stylized poster cards and subtle interactions
- Movie detail page with glass (ultra-thin material) panel and embedded video player
- Dark theme and gradient accents

## Tech stack
- SwiftUI (tvOS)
- AVKit (video playback)
- Asset catalogs for posters and app icons

## Project structure
- `IndieFocus/Model`: Data models (`Movie`, `MovieData`)
- `IndieFocus/View`: Screens (`HomeView`, `MovieDetailView`)
- `IndieFocus/Assets.xcassets`: Images and color assets
- `IndieFocus/IndieFocusApp.swift`: App entry point

## Build & Run
1. Open `IndieFocus.xcodeproj` in Xcode (15.x or later recommended).
2. Select a tvOS Simulator target (e.g., Apple TV). 
3. Build and run the `IndieFocus` scheme.

> Note: If you see missing fonts/colors, ensure the asset catalog is included in the build target. The app is set to dark mode visuals by default.

## Screenshots
Add your screenshots to the `screenshots/` folder and reference here. Example:

![Home - Hero](screenshots/home_hero.png)
![Trending Row](screenshots/trending_row.png)
![Movie Detail](screenshots/detail.png)

## Linting (CI)
This repo includes a GitHub Actions workflow that installs and runs SwiftLint on macOS runners.
- Workflow path: `.github/workflows/swiftlint.yml`
- To run locally (optional):
  - Install via Homebrew: `brew install swiftlint`
  - Then run: `swiftlint`

## Git LFS
Large media files are tracked with Git LFS (`.png`, `.jpg`, `.jpeg`, `.mp4`, `.mov`). Ensure you have Git LFS installed if you plan to commit additional media.

## Roadmap
- Top navigation bar with logo, sections, and search
- Additional curated rows (Continue Watching, Top 10, New & Hot)
- Shimmer placeholders for loading
- Parallax effects for hero and cards

## License
MIT (or your preferred license). Add a LICENSE file if needed.
