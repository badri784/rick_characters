<div align="center">

# 🛸 Rick & Morty Characters App

<img width="394" height="340" alt="Rick and Morty" src="https://github.com/user-attachments/assets/b0abfd34-6920-4e64-8409-7f37b35afc1a" />

A Flutter application that browses characters from the [Rick and Morty API](https://rickandmortyapi.com/), built with **Clean Architecture**, **Bloc (Cubit)** state management, **Pagination**, and **Search** support.

![Flutter](https://img.shields.io/badge/Flutter-3.10+-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.10+-0175C2?logo=dart&logoColor=white)
![Bloc](https://img.shields.io/badge/State%20Management-Bloc%20%2F%20Cubit-blue)
![API](https://img.shields.io/badge/API-Rick%20%26%20Morty-44d62c)
![License](https://img.shields.io/badge/License-MIT-yellow)

</div>

---

## 📱 Features

| Feature | Description |
|---------|-------------|
| 🧑‍🚀 **Character Grid** | Browse all Rick & Morty characters in a responsive 2-column grid layout |
| 🔍 **Real-Time Search** | Instantly filter characters by name as you type |
| ♾️ **Infinite Scroll Pagination** | Seamlessly loads more characters when you reach the bottom |
| 📄 **Character Details** | Dedicated detail screen with gender, origin, location & episode count |
| 🎬 **Hero Animations** | Smooth shared-element transitions between grid and detail screens |
| 🖼️ **Zoomable Image Dialog** | Tap a character image to open a full-screen, pinch-to-zoom dialog |
| ✍️ **Animated Text** | Character names animate with a typewriter effect on the detail screen |
| 🌐 **Offline Detection** | Detects network status and shows a user-friendly "No Internet" screen |
| 🖼️ **Cached Images** | Images are cached locally with a custom reusable `CustomCachedNetworkImage` widget |
| 🎨 **Native Splash Screen** | Branded splash screen on app launch |
| ⚡ **Loading Animations** | Elegant dot-wave and progressive-dot loading indicators |
| 🟢🔴 **Status Indicators** | Color-coded badges showing Alive / Dead / Unknown status |

---

## 🏗️ Architecture

The project follows a **Clean Architecture** approach with clear separation of concerns:

```
lib/
├── main.dart                          # App entry point
├── app_router.dart                    # Route generation & DI setup
│
├── core/                              # Shared / Domain layer
│   ├── bloc/
│   │   └── cubit/
│   │       ├── characters_cubit.dart  # Business logic (fetch, search, paginate)
│   │       └── characters_state.dart  # Cubit states
│   ├── models/
│   │   ├── characters.dart            # Characters response model
│   │   └── result/
│   │       └── results.dart           # Single character model
│   │   └── location/                  # Location model
│   │   └── orgine/                    # Origin model
│   │   └── episode/                   # Episode model
│   │   └── info/                      # Pagination info model
│   ├── networking/
│   │   ├── web_services/
│   │   │   └── web_service.dart       # Retrofit API client
│   │   └── repo/
│   │       └── characters_repo.dart   # Repository layer
│   ├── theming/
│   │   ├── colors.dart                # App color palette
│   │   └── textstyle.dart             # Text style constants
│   ├── helpers/
│   │   ├── strings.dart               # Route name constants
│   │   └── height.dart                # Spacing helpers
│   └── widget/
│       ├── build_no_internet.dart     # No-internet fallback UI
│       ├── character_detail_card.dart  # Reusable detail card (ListTile-style)
│       ├── custom_cached_network_image.dart  # Reusable cached image widget
│       └── text_info.dart             # Info text widget
│
└── fetures/                           # Feature / Presentation layer
    ├── screens/
    │   ├── charateris_screen.dart      # Main characters list screen
    │   └── characters_detail.dart      # Character detail screen
    └── widget/
        ├── bloc_widget.dart           # BlocBuilder + pagination listener
        ├── character_item.dart        # Single character grid card
        ├── character_detail_card.dart  # Detail screen info cards
        ├── character_image_dialog.dart # Zoomable image dialog with Hero
        ├── characters_grid.dart       # GridView builder
        ├── characters_loading.dart    # Loading state widget
        ├── feiled_data.dart           # Error/failure state widget
        ├── search_text_field.dart     # Search input field
        └── sliver_app_bar_detail_screen.dart  # Collapsible app bar with animated title
```

---

## 🧰 Tech Stack & Packages

| Package | Purpose |
|---------|---------|
| [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) | State management via Cubit |
| [`dio`](https://pub.dev/packages/dio) | HTTP client |
| [`retrofit`](https://pub.dev/packages/retrofit) | Type-safe REST API client (code generation) |
| [`json_serializable`](https://pub.dev/packages/json_serializable) | JSON ↔ Dart model code generation |
| [`cached_network_image`](https://pub.dev/packages/cached_network_image) | Image caching & placeholder support |
| [`loading_animation_widget`](https://pub.dev/packages/loading_animation_widget) | Beautiful loading animations |
| [`animated_text_kit`](https://pub.dev/packages/animated_text_kit) | Typewriter text animation |
| [`flutter_offline`](https://pub.dev/packages/flutter_offline) | Network connectivity detection |
| [`flutter_native_splash`](https://pub.dev/packages/flutter_native_splash) | Native splash screen |
| [`flutter_svg`](https://pub.dev/packages/flutter_svg) | SVG rendering support |

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK `^3.10.4`
- Dart SDK `^3.10.4`

### Installation

```bash
# Clone the repository
git clone https://github.com/your-username/rick_characters.git
cd rick_characters

# Install dependencies
flutter pub get

# Generate model & Retrofit code
dart run build_runner build --delete-conflicting-outputs

# Generate native splash screen
dart run flutter_native_splash:create

# Run the app
flutter run
```

---

## 🧪 Performance Notes

- ⚡ **No heavy logic inside `build()`** — all business logic lives in the Cubit
- 🔄 **Minimal widget rebuilds** — `BlocBuilder` only rebuilds when state changes
- 📡 **Controlled network requests** — pagination prevents redundant API calls with an `isLoading` guard
- 🖼️ **Efficient image loading** — `CachedNetworkImage` avoids re-downloading images
- 🏎️ **Smooth scrolling** — `BouncingScrollPhysics` + `shrinkWrap` for a fluid grid experience

---

## 📡 API

This app uses the free [Rick and Morty API](https://rickandmortyapi.com/):

| Endpoint | Description |
|----------|-------------|
| `GET /character` | Fetch all characters |
| `GET /character?page={page}` | Fetch characters by page (pagination) |

---

## 📸 Screens

| Characters Grid | Character Detail | Search | Offline |
|:-:|:-:|:-:|:-:|
| Responsive grid with status indicators | SliverAppBar with Hero animation | Real-time filtering | No-internet fallback |

---

## 🤝 Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

<div align="center">

Made with ❤️ and Flutter

</div>
