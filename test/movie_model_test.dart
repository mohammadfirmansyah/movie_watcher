import 'package:flutter_test/flutter_test.dart';
import 'package:movie_watcher/models/movie.dart';

void main() {
  group('Movie Model Tests', () {
    test('Movie should be created with all required fields', () {
      // Arrange & Act
      final movie = Movie(
        id: '1',
        title: 'Test Movie',
        genre: 'Action',
        description: 'A test movie description',
        imageUrl: 'https://example.com/image.jpg',
        videoUrl: 'https://example.com/video.mp4',
      );

      // Assert
      expect(movie.id, '1');
      expect(movie.title, 'Test Movie');
      expect(movie.genre, 'Action');
      expect(movie.description, 'A test movie description');
      expect(movie.imageUrl, 'https://example.com/image.jpg');
      expect(movie.videoUrl, 'https://example.com/video.mp4');
    });

    test('Movie.toMap() should convert Movie to Map correctly', () {
      // Arrange
      final movie = Movie(
        id: '1',
        title: 'Test Movie',
        genre: 'Action',
        description: 'A test movie description',
        imageUrl: 'https://example.com/image.jpg',
        videoUrl: 'https://example.com/video.mp4',
      );

      // Act
      final movieMap = movie.toMap();

      // Assert
      expect(movieMap['id'], '1');
      expect(movieMap['title'], 'Test Movie');
      expect(movieMap['genre'], 'Action');
      expect(movieMap['description'], 'A test movie description');
      expect(movieMap['imageUrl'], 'https://example.com/image.jpg');
      expect(movieMap['videoUrl'], 'https://example.com/video.mp4');
    });

    test('Movie.fromMap() should create Movie from Map correctly', () {
      // Arrange
      final movieMap = {
        'id': '1',
        'title': 'Test Movie',
        'genre': 'Action',
        'description': 'A test movie description',
        'imageUrl': 'https://example.com/image.jpg',
        'videoUrl': 'https://example.com/video.mp4',
      };

      // Act
      final movie = Movie.fromMap(movieMap);

      // Assert
      expect(movie.id, '1');
      expect(movie.title, 'Test Movie');
      expect(movie.genre, 'Action');
      expect(movie.description, 'A test movie description');
      expect(movie.imageUrl, 'https://example.com/image.jpg');
      expect(movie.videoUrl, 'https://example.com/video.mp4');
    });

    test('Movie toMap and fromMap should be reversible', () {
      // Arrange
      final originalMovie = Movie(
        id: '1',
        title: 'Test Movie',
        genre: 'Action',
        description: 'A test movie description',
        imageUrl: 'https://example.com/image.jpg',
        videoUrl: 'https://example.com/video.mp4',
      );

      // Act
      final movieMap = originalMovie.toMap();
      final reconstructedMovie = Movie.fromMap(movieMap);

      // Assert
      expect(reconstructedMovie.id, originalMovie.id);
      expect(reconstructedMovie.title, originalMovie.title);
      expect(reconstructedMovie.genre, originalMovie.genre);
      expect(reconstructedMovie.description, originalMovie.description);
      expect(reconstructedMovie.imageUrl, originalMovie.imageUrl);
      expect(reconstructedMovie.videoUrl, originalMovie.videoUrl);
    });
  });

  group('Movie Field Validation Tests', () {
    test('Movie should handle empty strings', () {
      // Arrange & Act
      final movie = Movie(
        id: '',
        title: '',
        genre: '',
        description: '',
        imageUrl: '',
        videoUrl: '',
      );

      // Assert
      expect(movie.id, '');
      expect(movie.title, '');
      expect(movie.genre, '');
      expect(movie.description, '');
      expect(movie.imageUrl, '');
      expect(movie.videoUrl, '');
    });

    test('Movie should handle special characters in strings', () {
      // Arrange & Act
      final movie = Movie(
        id: '123-abc',
        title: 'Movie: The Sequel (2024)',
        genre: 'Sci-Fi/Action',
        description: 'A movie with "quotes" and \'apostrophes\'',
        imageUrl: 'https://example.com/image?id=123&format=jpg',
        videoUrl: 'https://example.com/video.mp4?quality=1080p',
      );

      // Assert
      expect(movie.title, contains('The Sequel'));
      expect(movie.genre, contains('/'));
      expect(movie.description, contains('"'));
      expect(movie.imageUrl, contains('?'));
      expect(movie.videoUrl, contains('quality=1080p'));
    });
  });
}
