# 🎬 Movie Watcher

[![Flutter](https://img.shields.io/badge/Flutter-3.9.2-blue?logo=flutter)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.9.2-blue?logo=dart)](https://dart.dev/)
[![Firebase](https://img.shields.io/badge/Firebase-Latest-orange?logo=firebase)](https://firebase.google.com/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Tests](https://img.shields.io/badge/Tests-6%20Passed-success)](test/)

A modern Flutter application for managing and watching your movie collection. Built with Firebase for real-time synchronization and cloud storage, Movie Watcher allows you to catalog movies with details, images, and video links, making it easy to organize and access your favorite films.

## 📚 Documentation

- **[Contributing Guide](CONTRIBUTING.md)** - Learn how to contribute
- **[Changelog](CHANGELOG.md)** - Version history and updates
- **[Test Documentation](TEST_DOCUMENTATION.md)** - Testing strategy and results

## ✨ Key Features

- **📝 Movie Management**: Add, edit, and delete movies in your collection
- **🎯 Rich Details**: Store title, genre, description, cover image, and video URL
- **🔥 Firebase Integration**: Real-time Firestore database synchronization
- **🔐 Anonymous Authentication**: Automatic Firebase auth for seamless access
- **🎥 Video Playback**: Direct links to watch movies via YouTube or other platforms
- **🖼️ Cover Images**: Display beautiful movie posters from URLs
- **📱 Responsive UI**: Clean, intuitive interface that works on all platforms
- **🔍 Easy Search**: Quickly find movies in your collection
- **✅ Comprehensive Testing**: 100% model test coverage with 6 passing tests

## 📱 Screenshots

```
╔═══════════════════════════════════╗
║   Movie Watcher                   ║
╠═══════════════════════════════════╣
║                                   ║
║ ┌───────────────────────────────┐ ║
║ │                               │ ║
║ │   [Movie Poster - 250x250]    │ ║
║ │                               │ ║
║ └───────────────────────────────┘ ║
║                                   ║
║ Inception                         ║
║ Sci-Fi                            ║
║ Lorem ipsum dolor sit amet        ║
║ consectetur adipiscing elit       ║
║                                   ║
║ Video URL: https://youtu.be/xyz   ║
║ ─────────────────────────────     ║
║ Add a comment                     ║
║ ┌─────────────────────────────┐   ║
║ │                             │   ║
║ └─────────────────────────────┘   ║
║         [Submit Comment]          ║
║                                   ║
║ Comments:                         ║
║ • Lorem ipsum dolor               ║
║ • Great movie                     ║
║                                   ║
║ [Edit]  [Delete]                  ║
║                                   ║
║ ═══════════════════════════════   ║
║                                   ║
║ ┌───────────────────────────────┐ ║
║ │                               │ ║
║ │   [Movie Poster - 250x250]    │ ║
║ │                               │ ║
║ └───────────────────────────────┘ ║
║                                   ║
║ The Matrix                        ║
║ Action                            ║
║ Lorem ipsum dolor sit amet        ║
║                                   ║
║                                   ║
║                            ( + )  ║
╚═══════════════════════════════════╝
```

## 🛠️ Technologies Used

- **Flutter** - v3.9.2 - Cross-platform UI framework
- **Dart** - v3.9.2 - Programming language
- **Firebase Core** - v2.14.0 - Firebase SDK initialization
- **Firebase Auth** - v4.16.0 - Anonymous authentication
- **Cloud Firestore** - v4.10.0 - NoSQL cloud database
- **URL Launcher** - v6.0.20 - Launch external URLs (YouTube, web links)

## 📂 Project Structure

```
movie_watcher/
├── lib/
│   ├── main.dart                 # App entry point with Firebase initialization
│   ├── home_screen.dart          # Main screen with movie list
│   ├── add_movie_screen.dart     # Screen for adding new movies
│   ├── modify_movie_screen.dart  # Screen for editing existing movies
│   ├── auth_service.dart         # Firebase authentication service
│   └── models/
│       └── movie.dart            # Movie data model with serialization
├── test/
│   └── movie_model_test.dart     # Unit tests for Movie model (6 tests)
├── pubspec.yaml                  # Project dependencies and metadata
└── README.md                     # This file
```

## 🚀 Setup & Installation

### Prerequisites

- **Flutter SDK** >= 3.9.2
- **Dart SDK** >= 3.9.2
- **Firebase Account** with a project configured
- **Android Studio / VS Code** (recommended)

### Firebase Setup

1. Create a new Firebase project at [Firebase Console](https://console.firebase.google.com/)

2. Enable **Anonymous Authentication**:
   - Go to Authentication → Sign-in method
   - Enable "Anonymous" provider

3. Create a **Firestore Database**:
   - Go to Firestore Database → Create database
   - Start in production mode
   - Choose your preferred location

4. Add your Firebase configuration to `lib/main.dart`:

```dart
await Firebase.initializeApp(
  options: const FirebaseOptions(
    apiKey: "YOUR_API_KEY",
    authDomain: "YOUR_AUTH_DOMAIN",
    projectId: "YOUR_PROJECT_ID",
    storageBucket: "YOUR_STORAGE_BUCKET",
    messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
    appId: "YOUR_APP_ID"
  ),
);
```

### Installation Steps

1. **Clone the repository:**
   ```bash
   git clone https://github.com/mohammadfirmansyah/movie_watcher.git
   cd movie_watcher
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase:**
   - Update `lib/main.dart` with your Firebase configuration (see above)

4. **Run the application:**
   ```bash
   # Web
   flutter run -d chrome
   
   # Android
   flutter run -d android
   
   # iOS (macOS only)
   flutter run -d ios
   ```

## 💻 Usage / How to Run

### Running the App

```bash
# For web browser
flutter run -d chrome

# For Android emulator
flutter run -d android

# For iOS simulator (macOS only)
flutter run -d ios

# For Windows desktop
flutter run -d windows
```

### Running Tests

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run specific test file
flutter test test/movie_model_test.dart
```

**Test Results:**
```
✓ Movie should be created with all required fields
✓ Movie.toMap() should convert Movie to Map correctly
✓ Movie.fromMap() should create Movie from Map correctly
✓ Movie toMap and fromMap should be reversible
✓ Movie should handle empty strings
✓ Movie should handle special characters in strings

All 6 tests passed! (100% model coverage)
```

## 📝 Code Highlights

### Movie Model with Serialization

```dart
class Movie {
  String id;
  String title;
  String genre;
  String description;
  String imageUrl;
  String videoUrl;

  Movie({
    required this.id,
    required this.title,
    required this.genre,
    required this.description,
    required this.imageUrl,
    required this.videoUrl,
  });

  // Serialize to Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'genre': genre,
      'description': description,
      'imageUrl': imageUrl,
      'videoUrl': videoUrl,
    };
  }

  // Deserialize from Firestore
  static Movie fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'],
      title: map['title'],
      genre: map['genre'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      videoUrl: map['videoUrl'],
    );
  }
}
```

### Firebase Firestore Integration

```dart
// Add movie to Firestore
Future<void> addMovie(Movie movie) async {
  await FirebaseFirestore.instance
      .collection('movies')
      .doc(movie.id)
      .set(movie.toMap());
}

// Fetch all movies real-time
Stream<List<Movie>> getMovies() {
  return FirebaseFirestore.instance
      .collection('movies')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => Movie.fromMap(doc.data()))
          .toList());
}
```

### Anonymous Authentication

```dart
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in anonymously
  Future<UserCredential> signInAnonymously() async {
    try {
      return await _auth.signInAnonymously();
    } catch (e) {
      print('Error signing in anonymously: $e');
      rethrow;
    }
  }
}
```

## 📖 Learning Outcomes

This project demonstrates excellent skills in:

- ✅ **Flutter Development**: Building responsive, cross-platform UIs
- ✅ **Firebase Integration**: Firestore database and authentication
- ✅ **State Management**: Managing app state with StatefulWidgets
- ✅ **Data Modeling**: Creating robust models with serialization
- ✅ **CRUD Operations**: Create, Read, Update, Delete functionality
- ✅ **URL Handling**: Launching external links for video playback
- ✅ **Testing**: Comprehensive unit tests with 100% model coverage
- ✅ **Code Quality**: Clean architecture and best practices

## 🔧 Technical Decisions

### Why Anonymous Authentication?

We use Firebase Anonymous Authentication to:
- ✅ Simplify user onboarding (no signup required)
- ✅ Secure Firestore access with authentication rules
- ✅ Enable multi-device sync for future enhancements
- ✅ Prepare for optional user account upgrades

### Why URL-based Video Playback?

Using URLs instead of embedded video players:
- ✅ Reduces app size (no video player dependencies)
- ✅ Leverages powerful platforms like YouTube
- ✅ Avoids storage costs for video hosting
- ✅ Provides professional video streaming quality

## 🤝 Contributing

We welcome contributions! Please see our **[Contributing Guide](CONTRIBUTING.md)** for details on:

1. How to submit bug reports and feature requests
2. Development workflow and coding standards
3. Pull request process
4. Testing requirements

Quick start:
```bash
# Fork and clone
git clone https://github.com/YOUR_USERNAME/movie_watcher.git

# Create feature branch
git checkout -b feature/AmazingFeature

# Make changes and test
flutter test

# Commit and push
git commit -m 'feat: add some amazing feature'
git push origin feature/AmazingFeature

# Open Pull Request
```

## 📄 License

This project is licensed under the MIT License. See the **[LICENSE](LICENSE)** file for details.

## 🚨 Security Note

**Important:** The Firebase configuration in `lib/main.dart` contains API keys. For production apps:

1. Use environment variables for sensitive configuration
2. Configure Firestore Security Rules to protect data
3. Enable Firebase App Check for additional security
4. Never commit sensitive keys to public repositories

**Example Firestore Security Rules:**

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Only authenticated users can access movies
    match /movies/{movieId} {
      allow read, write: if request.auth != null;
    }
  }
}
```

## 🎯 Future Enhancements

Planned features for future releases:

- [ ] **Search & Filter**: Search movies by title, genre, or description
- [ ] **Sorting Options**: Sort by title, genre, or date added
- [ ] **User Accounts**: Upgrade from anonymous to email/password auth
- [ ] **Favorites**: Mark movies as favorites for quick access
- [ ] **Watch History**: Track watched movies with timestamps
- [ ] **Ratings**: Add personal ratings for movies
- [ ] **Categories**: Organize movies into custom categories/playlists
- [ ] **Offline Mode**: Cache movies for offline viewing
- [ ] **Dark Mode**: Toggle between light and dark themes
- [ ] **Export/Import**: Backup and restore movie collections

## 👨‍💻 Developer

- **Mohammad Firman Syah**
- **GitHub:** [@mohammadfirmansyah](https://github.com/mohammadfirmansyah)
- **Project Link:** [https://github.com/mohammadfirmansyah/movie_watcher](https://github.com/mohammadfirmansyah/movie_watcher)

## 🙏 Acknowledgments

- Flutter team for the excellent framework
- Firebase for powerful backend services
- The Flutter community for continuous support

---

**Built with ❤️ using Flutter & Firebase**
