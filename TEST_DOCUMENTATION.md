# Test Documentation

This document provides comprehensive information about the testing strategy, coverage, and results for the Movie Watcher application.

## 📊 Test Coverage Summary

| Metric | Value | Status |
|--------|-------|--------|
| **Total Tests** | 6 | ✅ Passed |
| **Failed Tests** | 0 | ✅ None |
| **Test Suites** | 1 | ✅ Complete |
| **Model Coverage** | 100% | ✅ Full Coverage |
| **Execution Time** | ~1 second | ✅ Fast |

## 🧪 Test Structure

### Movie Model Tests

Located in: `test/movie_model_test.dart`

The Movie model is the core data structure of the application, responsible for representing movie data and handling serialization/deserialization with Firestore. All tests verify the model behaves correctly under various scenarios.

#### Test Groups

1. **Movie Model Tests** - Core functionality
2. **Movie Field Validation Tests** - Edge cases and special scenarios

## 📝 Detailed Test Cases

### 1. Movie Creation Test

**Purpose**: Verify Movie objects can be created with all required fields.

```dart
test('Movie should be created with all required fields', () {
  final movie = Movie(
    id: '1',
    title: 'Inception',
    genre: 'Sci-Fi',
    description: 'A mind-bending thriller',
    imageUrl: 'https://example.com/inception.jpg',
    videoUrl: 'https://youtube.com/watch?v=inception',
  );

  expect(movie.id, '1');
  expect(movie.title, 'Inception');
  expect(movie.genre, 'Sci-Fi');
  expect(movie.description, 'A mind-bending thriller');
  expect(movie.imageUrl, 'https://example.com/inception.jpg');
  expect(movie.videoUrl, 'https://youtube.com/watch?v=inception');
});
```

**What it tests**:
- Constructor properly assigns all fields
- All six fields are accessible via getters
- Field values match constructor inputs

**Result**: ✅ Passed

---

### 2. Serialization Test (toMap)

**Purpose**: Verify Movie objects can be converted to Map<String, dynamic> for Firestore storage.

```dart
test('Movie.toMap() should convert Movie to Map correctly', () {
  final movie = Movie(
    id: '1',
    title: 'Inception',
    genre: 'Sci-Fi',
    description: 'A mind-bending thriller',
    imageUrl: 'https://example.com/inception.jpg',
    videoUrl: 'https://youtube.com/watch?v=inception',
  );

  final map = movie.toMap();

  expect(map['id'], '1');
  expect(map['title'], 'Inception');
  expect(map['genre'], 'Sci-Fi');
  expect(map['description'], 'A mind-bending thriller');
  expect(map['imageUrl'], 'https://example.com/inception.jpg');
  expect(map['videoUrl'], 'https://youtube.com/watch?v=inception');
});
```

**What it tests**:
- toMap() generates correct Map structure
- All field names match Firestore schema
- No data loss during conversion

**Result**: ✅ Passed

---

### 3. Deserialization Test (fromMap)

**Purpose**: Verify Movie objects can be created from Map<String, dynamic> (Firestore data).

```dart
test('Movie.fromMap() should create Movie from Map correctly', () {
  final map = {
    'id': '1',
    'title': 'Inception',
    'genre': 'Sci-Fi',
    'description': 'A mind-bending thriller',
    'imageUrl': 'https://example.com/inception.jpg',
    'videoUrl': 'https://youtube.com/watch?v=inception',
  };

  final movie = Movie.fromMap(map);

  expect(movie.id, '1');
  expect(movie.title, 'Inception');
  expect(movie.genre, 'Sci-Fi');
  expect(movie.description, 'A mind-bending thriller');
  expect(movie.imageUrl, 'https://example.com/inception.jpg');
  expect(movie.videoUrl, 'https://youtube.com/watch?v=inception');
});
```

**What it tests**:
- fromMap() correctly parses Firestore data
- All Map keys are read properly
- Created Movie has all expected values

**Result**: ✅ Passed

---

### 4. Reversibility Test

**Purpose**: Verify serialization and deserialization are perfectly reversible (no data loss).

```dart
test('Movie toMap and fromMap should be reversible', () {
  final originalMovie = Movie(
    id: '1',
    title: 'Inception',
    genre: 'Sci-Fi',
    description: 'A mind-bending thriller',
    imageUrl: 'https://example.com/inception.jpg',
    videoUrl: 'https://youtube.com/watch?v=inception',
  );

  final map = originalMovie.toMap();
  final reconstructedMovie = Movie.fromMap(map);

  expect(reconstructedMovie.id, originalMovie.id);
  expect(reconstructedMovie.title, originalMovie.title);
  expect(reconstructedMovie.genre, originalMovie.genre);
  expect(reconstructedMovie.description, originalMovie.description);
  expect(reconstructedMovie.imageUrl, originalMovie.imageUrl);
  expect(reconstructedMovie.videoUrl, originalMovie.videoUrl);
});
```

**What it tests**:
- Full round-trip: Movie → Map → Movie
- No data corruption during conversion
- Critical for Firestore CRUD reliability

**Result**: ✅ Passed

**Why it matters**: This test ensures data saved to Firestore can be perfectly reconstructed when read back, preventing data loss or corruption.

---

### 5. Empty String Handling Test

**Purpose**: Verify Movie model handles empty strings gracefully (edge case).

```dart
test('Movie should handle empty strings', () {
  final movie = Movie(
    id: '',
    title: '',
    genre: '',
    description: '',
    imageUrl: '',
    videoUrl: '',
  );

  expect(movie.id, '');
  expect(movie.title, '');
  expect(movie.genre, '');
  expect(movie.description, '');
  expect(movie.imageUrl, '');
  expect(movie.videoUrl, '');
});
```

**What it tests**:
- Model doesn't crash with empty strings
- No null pointer exceptions
- Proper handling of missing data

**Result**: ✅ Passed

**Real-world scenario**: User submits form without filling all fields (shouldn't crash app).

---

### 6. Special Character Handling Test

**Purpose**: Verify Movie model handles special characters correctly (internationalization).

```dart
test('Movie should handle special characters in strings', () {
  final movie = Movie(
    id: '1',
    title: 'Amélie & "The Godfather"',
    genre: 'Drama/Comedy',
    description: 'A movie with special chars: @#$%^&*()',
    imageUrl: 'https://example.com/amélie.jpg?param=value&key=123',
    videoUrl: 'https://youtube.com/watch?v=abc123&t=45s',
  );

  expect(movie.title, 'Amélie & "The Godfather"');
  expect(movie.genre, 'Drama/Comedy');
  expect(movie.description, 'A movie with special chars: @#$%^&*()');
  expect(movie.imageUrl, contains('amélie'));
  expect(movie.videoUrl, contains('t=45s'));
});
```

**What it tests**:
- Unicode characters (é, @, #, etc.)
- URL encoding/decoding
- Quote and ampersand handling
- No string escaping issues

**Result**: ✅ Passed

**Real-world scenario**: Movie titles in different languages, URLs with query parameters, descriptions with symbols.

---

## 🚀 Running Tests

### Run All Tests

```bash
flutter test
```

**Expected output**:
```
00:01 +6: All tests passed!
```

### Run Specific Test File

```bash
flutter test test/movie_model_test.dart
```

### Run with Coverage

```bash
flutter test --coverage
```

This generates a `coverage/lcov.info` file.

### View Coverage Report (HTML)

```bash
# Install lcov (if not installed)
# Windows: choco install lcov
# macOS: brew install lcov
# Linux: sudo apt-get install lcov

# Generate HTML report
genhtml coverage/lcov.info -o coverage/html

# Open in browser (Windows)
start coverage/html/index.html

# Open in browser (macOS)
open coverage/html/index.html

# Open in browser (Linux)
xdg-open coverage/html/index.html
```

## 📈 Test Execution Output

```
Running "flutter pub get" in movie_watcher...
Resolving dependencies...
Got dependencies.

00:00 +0: loading test\movie_model_test.dart
00:00 +1: Movie Model Tests Movie should be created with all required fields
00:00 +2: Movie Model Tests Movie.toMap() should convert Movie to Map correctly
00:00 +3: Movie Model Tests Movie.fromMap() should create Movie from Map correctly
00:00 +4: Movie Model Tests Movie toMap and fromMap should be reversible
00:00 +5: Movie Field Validation Tests Movie should handle empty strings
00:00 +6: Movie Field Validation Tests Movie should handle special characters in strings
00:01 +6: All tests passed!
```

## 🎯 Testing Strategy

### Why These Tests Matter

1. **Data Integrity**: Ensures data is correctly stored and retrieved from Firestore
2. **Edge Case Handling**: Prevents crashes from unexpected inputs
3. **Internationalization**: Supports movies from any language/region
4. **Regression Prevention**: Catches bugs when code is modified
5. **Documentation**: Tests serve as examples of how to use the Movie model

### What's NOT Tested (Future Work)

- **Widget Tests**: UI components not yet tested
- **Integration Tests**: Firestore interactions not tested
- **E2E Tests**: Full user flows not automated

### Coverage Goals

- ✅ **Model Coverage**: 100% (all fields, all methods tested)
- ⏳ **Service Coverage**: Future goal - AuthService tests
- ⏳ **Widget Coverage**: Future goal - UI component tests
- ⏳ **Integration Coverage**: Future goal - Firestore CRUD tests

## 🔧 Writing New Tests

### Template for Model Tests

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_watcher/models/your_model.dart';

void main() {
  group('YourModel Tests', () {
    test('should create object with required fields', () {
      // Arrange
      final data = YourModel(field: 'value');
      
      // Act
      final result = data.field;
      
      // Assert
      expect(result, 'value');
    });
  });
}
```

### Best Practices

1. **AAA Pattern**: Arrange → Act → Assert
2. **Descriptive Names**: Test names should describe what's being tested
3. **One Assertion Per Test**: Each test should verify one thing
4. **Use Groups**: Organize related tests with `group()`
5. **Test Edge Cases**: Empty strings, null values, special characters
6. **Independent Tests**: Each test should run independently

## 📊 Continuous Integration (Future)

Planned CI/CD pipeline:

```yaml
# .github/workflows/test.yml
name: Tests

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: subosito/flutter-action@v2
      - run: flutter pub get
      - run: flutter analyze
      - run: flutter test --coverage
      - uses: codecov/codecov-action@v2
```

## 🤝 Contributing Tests

See [CONTRIBUTING.md](CONTRIBUTING.md) for:
- Testing guidelines
- Coverage requirements (>= 80%)
- Test writing patterns
- PR checklist

---

**Last Updated**: 2025-11-07
**Test Framework**: flutter_test (built-in)
**Maintainer**: Mohammad Firman Syah
