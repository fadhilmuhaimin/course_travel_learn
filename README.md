# Course Travel Learn

A Flutter mobile app for browsing travel destinations, including top picks, full destination lists, and detail pages with image galleries.

## Overview

This repository implements a destination discovery app using a layered Flutter architecture:
- **Presentation**: Flutter UI + BLoC/Cubit state management
- **Domain**: entities, repository contracts, and use cases
- **Data**: remote/local data sources and repository implementation

The app currently focuses on the `destination` feature module and includes offline cache fallback for destination lists.

## Key Features

- Dashboard with bottom navigation
- Home screen sections:
  - Top destinations carousel
  - All destinations list
  - Category chips (UI)
- Destination detail page with staggered image gallery
- Remote API integration for:
  - all destinations
  - top destinations
  - destination search
- Local caching with `SharedPreferences`
- Network connectivity checks before remote fetch in selected flows

## Screenshots

> No app screenshots are currently included in this repository.  
> Add screenshots/gifs here for public presentation.

## Technical Stack

- **Framework**: Flutter
- **Language**: Dart (SDK constraint: `>=3.3.4 <4.0.0`)
- **State Management**: `flutter_bloc` (`Bloc` + `Cubit`)
- **Dependency Injection**: `get_it`
- **Networking**: `http`
- **Local Storage**: `shared_preferences`
- **Functional/Error Handling**: `dartz`, custom failure/exception classes
- **UI Packages**: `extended_image`, `smooth_page_indicator`, `flutter_rating_bar`, `google_fonts`, `staggered_grid_view_flutter`, `photo_view`

## Project Structure

```text
lib/
  api/                    # API URL configuration
  common/                 # Routing and shared app utilities
  core/                   # Cross-cutting concerns (errors, network info)
  features/
    destination/
      data/               # Data sources, models, repository impl
      domain/             # Entities, repository contracts, use cases
      presentation/       # Pages, widgets, BLoC/Cubit
  injection.dart          # Service locator registrations
  main.dart               # App entry point
test/                     # Test scaffolding and widget test template
assets/images/            # Local image assets
```

## Prerequisites

- Flutter SDK installed and configured
- Dart SDK compatible with the constraint in `pubspec.yaml`
- Android Studio / VS Code + Flutter tooling
- Device emulator/simulator or physical device

## Installation

```bash
git clone <your-fork-or-repo-url>
cd course_travel_learn
flutter pub get
```

## Run the App

```bash
flutter run
```

## Lint & Test

```bash
flutter analyze
flutter test
```

Notes:
- The repository contains a default `test/widget_test.dart` template and additional test scaffolding directories.
- Some feature test files exist but are currently empty placeholders.

## Configuration / API Notes

- Base API URL is defined in:
  - `lib/api/urls.dart`
- Current default points to a local network host (`http://192.168.1.9/api_travel`).
- Update this value to match your backend environment before running API-dependent flows.

## Dependency Injection & State Management

- DI setup is centralized in `lib/injection.dart` using `GetIt`.
- `main.dart` initializes dependencies via `initLocator()`.
- App-level state providers are set with `MultiBlocProvider`.
- Destination feature logic is handled by:
  - `AllDestinationBloc`
  - `TopDestinationBloc`
  - `SearchDestinationBloc`
  - `DashboadCubit` for dashboard tab state

## Contributing

Contributions are welcome. For changes:
1. Create a feature branch
2. Keep changes focused and minimal
3. Run `flutter analyze` and `flutter test`
4. Open a pull request with a clear description

## License

No license file is currently present in this repository.  
If you plan to publish or reuse this project, add a LICENSE file and update this section.
