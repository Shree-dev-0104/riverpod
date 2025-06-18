
// import 'package:example/home_page_provider.dart';
import 'package:example/Future%20Provider/joke_screen.dart';
import 'package:example/home_page_state_provider.dart';
import 'package:example/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = Provider<String>((ref) => 'Minu');
final nameStateProvider = StateProvider<String?>((ref) => null); // Providers are usually immutable, but StateProvider allows for mutable state.

void main() {
  runApp( const ProviderScope(
    
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const HomePageProvider(),
      // home: const HomePageStateProvider(),
      // home: UserScreen(),
      home : const JokeScreen()
    );
  }
}