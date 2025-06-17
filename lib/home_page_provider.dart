//  P R O V I D E R  P A T T E R N

import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class HomePage extends ConsumerWidget { // Method 2: Using ConsumerWidget
//   const HomePage({super.key});
class HomePageProvider extends StatelessWidget {
  const HomePageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo Home Page'),
        ),
        body: Consumer( // Method 1: Using Consumer widget
          // builder: (context, ref, child) {
          builder: (context, ref, child) {
            final name = ref.watch(nameProvider);
            return Center(
              child: Text('Hello, $name!'),
            );
          }
        ),
      );
  }
}

// ref.watch vs ref.read:
// - ref.watch: Used to listen to changes in the provider. The widget will rebuild when the provider's value changes.(Not Recommended)
// - ref.read: Used to read the provider's value without listening for changes. The widget will not rebuild when the provider's value changes.(Recommended)