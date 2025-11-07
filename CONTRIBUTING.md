# Contributing to Movie Watcher

Thank you for considering contributing to Movie Watcher! This document provides guidelines and instructions for contributing to the project.

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Development Setup](#development-setup)
- [Coding Standards](#coding-standards)
- [Testing Guidelines](#testing-guidelines)
- [Commit Message Guidelines](#commit-message-guidelines)
- [Pull Request Process](#pull-request-process)

## Code of Conduct

This project follows a simple principle: **Be respectful, constructive, and collaborative**. We expect all contributors to maintain a professional and friendly environment.

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check existing issues. When creating a bug report, include:

**Bug Report Template:**
```markdown
**Description:**
Clear description of the bug

**To Reproduce:**
1. Go to '...'
2. Click on '...'
3. See error

**Expected Behavior:**
What should happen

**Actual Behavior:**
What actually happens

**Environment:**
- Flutter version: [e.g., 3.9.2]
- Dart version: [e.g., 3.9.2]
- Platform: [e.g., Android 14, iOS 17, Web]
- Firebase SDK versions

**Screenshots:**
If applicable
```

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues:

```markdown
**Feature Description:**
Clear description of the feature

**Problem it Solves:**
What problem does this solve?

**Proposed Solution:**
How would this feature work?

**Alternatives Considered:**
Other solutions you've thought about

**Additional Context:**
Mockups, examples, references
```

### Pull Requests

1. Fork the repository
2. Create your feature branch
3. Make your changes
4. Add/update tests
5. Ensure all tests pass
6. Update documentation
7. Create a Pull Request

## Development Setup

### Prerequisites

- Flutter SDK >= 3.9.2
- Dart SDK >= 3.9.2
- Firebase project configured
- Git

### Setup Steps

1. **Fork and clone:**
   ```bash
   git clone https://github.com/YOUR_USERNAME/movie_watcher.git
   cd movie_watcher
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase:**
   - Update `lib/main.dart` with your test Firebase credentials
   - Never commit real Firebase credentials

4. **Run the app:**
   ```bash
   flutter run -d chrome
   ```

5. **Run tests:**
   ```bash
   flutter test
   ```

## Coding Standards

### Dart/Flutter Style

Follow the [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style):

```dart
// ✅ GOOD: Clear, descriptive names
class MovieService {
  Future<void> addMovie(Movie movie) async {
    // Implementation
  }
}

// ❌ BAD: Unclear, abbreviated names
class MS {
  Future<void> add(Movie m) async {
    // Implementation
  }
}
```

### Code Structure

```dart
// 1. Imports (grouped and sorted)
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// 2. Class definition
class MyWidget extends StatefulWidget {
  // 3. Constructor
  const MyWidget({Key? key}) : super(key: key);
  
  // 4. CreateState
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  // 5. State variables
  String _data = '';
  
  // 6. Lifecycle methods
  @override
  void initState() {
    super.initState();
  }
  
  // 7. Helper methods
  void _helperMethod() {
    // Implementation
  }
  
  // 8. Build method
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```

### Naming Conventions

- **Classes**: PascalCase (`MovieScreen`, `AuthService`)
- **Variables/Functions**: camelCase (`movieList`, `addMovie`)
- **Constants**: lowerCamelCase (`defaultTimeout`)
- **Private members**: Prefix with `_` (`_privateMethod`)
- **Files**: snake_case (`movie_screen.dart`, `auth_service.dart`)

### Error Handling

Always include proper error handling:

```dart
// ✅ GOOD: Comprehensive error handling
Future<void> addMovie(Movie movie) async {
  try {
    await FirebaseFirestore.instance
        .collection('movies')
        .doc(movie.id)
        .set(movie.toMap());
  } on FirebaseException catch (e) {
    print('Firebase error: ${e.message}');
    rethrow;
  } catch (e) {
    print('Unexpected error: $e');
    rethrow;
  }
}

// ❌ BAD: No error handling
Future<void> addMovie(Movie movie) async {
  await FirebaseFirestore.instance
      .collection('movies')
      .doc(movie.id)
      .set(movie.toMap());
}
```

## Testing Guidelines

### Test Coverage Requirements

- **Model classes**: 100% coverage
- **Service classes**: >= 80% coverage
- **UI widgets**: Critical paths tested

### Writing Tests

```dart
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Movie Model Tests', () {
    test('should create movie with all fields', () {
      // Arrange
      final movie = Movie(
        id: '1',
        title: 'Test',
        genre: 'Action',
        description: 'Desc',
        imageUrl: 'url',
        videoUrl: 'video',
      );
      
      // Act & Assert
      expect(movie.title, 'Test');
      expect(movie.genre, 'Action');
    });
  });
}
```

### Running Tests

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test
flutter test test/movie_model_test.dart

# Verify coverage (should be >= 80%)
genhtml coverage/lcov.info -o coverage/html
```

## Commit Message Guidelines

Follow [Conventional Commits](https://www.conventionalcommits.org/):

### Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types

- **feat**: New feature
- **fix**: Bug fix
- **docs**: Documentation changes
- **style**: Code formatting (no logic change)
- **refactor**: Code refactoring
- **test**: Adding or updating tests
- **chore**: Build process, dependencies

### Examples

```bash
# Feature
feat(movie): add video URL field to movie model

Added videoUrl field to Movie class to support linking
to YouTube or other video platforms.

# Bug fix
fix(firestore): resolve null safety issue in fromMap

Fixed nullable field handling when deserializing movies
from Firestore documents.

# Documentation
docs(readme): update Firebase setup instructions

Added step-by-step guide for enabling anonymous auth
and configuring Firestore security rules.

# Testing
test(model): add Movie model serialization tests

Added 6 unit tests for Movie toMap/fromMap methods
to ensure data integrity.
```

## Pull Request Process

### PR Checklist

Before submitting:

- [ ] Code follows Dart/Flutter style guidelines
- [ ] All tests pass (`flutter test`)
- [ ] No analyzer warnings (`flutter analyze`)
- [ ] Documentation updated if needed
- [ ] Commit messages follow conventions
- [ ] Branch is up to date with main

### PR Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Refactoring

## Testing
Describe how you tested

## Screenshots
If UI changes

## Checklist
- [ ] Tests pass
- [ ] No analyzer warnings
- [ ] Documentation updated
```

### Review Process

1. Maintainer reviews code
2. Feedback provided if needed
3. Once approved, PR merged to main
4. Changes included in next release

## Flutter Analyze

Ensure no warnings:

```bash
flutter analyze

# Expected output:
Analyzing movie_watcher...
No issues found!
```

## Questions?

Open an issue with the `question` label for help or clarification.

## Thank You!

Your contributions make this project better! 🙏

---

**Happy Coding!** 🚀
