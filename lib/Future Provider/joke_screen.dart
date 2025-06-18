import 'package:example/Future%20Provider/joke_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JokeScreen extends ConsumerWidget {
  const JokeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jokeAsyncValue = ref.watch(jokeProvider);
    // ref.watch: A method to listen to the provider and rebuild the widget when the provider's state changes.
    // AsyncValue: A class that represents the state of an asynchronous operation, which can be in one of three states: data, loading, or error.

    return Scaffold(
      appBar: AppBar(title: const Text('Random Joke')),
      body: jokeAsyncValue.when( 
      // when: A method that allows you to handle different states of the FutureProvider (data, loading, error).
        data: (joke) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(joke.setup, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(joke.punchline, style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => ref.refresh(jokeProvider), 
                // ref.refresh: A method to refresh the provider, triggering a new fetch of the joke.
                // ref. has many methods to interact with providers, such as reading, watching, and refreshing. eg ref.read, ref.watch, ref.refresh
                child: const Text('Load Another'),
              )
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
