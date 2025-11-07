import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions (
    apiKey: "AIzaSyDNhf9GKrQqpEjqWutVVY6432pFupNQiYU",
    authDomain: "movie-watcher-app-d4a93.firebaseapp.com",
    projectId: "movie-watcher-app-d4a93",
    storageBucket: "movie-watcher-app-d4a93.firebasestorage.app",
    messagingSenderId: "42418818807",
    appId: "1:42418818807:web:4ee0bd152e4f42c6194df2"
      ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Watcher',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}