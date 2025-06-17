import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomePageStateProvider extends StatelessWidget {
  
  const HomePageStateProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo Home Page'),
        ),
        body: Consumer( 
          builder: (context, ref, child) {
            final name = ref.watch(nameStateProvider) ?? 'No Name';
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text('Hello, $name!'),
                ),

                TextField(
                  onSubmitted: (value) {
                    ref.read(nameStateProvider.notifier).update((state)=> value); // StateProvider allows for mutable state. its ref gives access to the notifier, which can be used to update the state.
                    // ref.read(nameStateProvider.notifer).update((state) => value); 
                  },

                )
              ],
            );
          }
        ),
      );
  }
}
