import 'dart:convert';
import 'package:example/Future%20Provider/joke.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final jokeProvider = FutureProvider<Joke>((ref) async {
  final response = await http.get(Uri.parse('https://official-joke-api.appspot.com/random_joke'));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return Joke.fromJson(data);
  } else { 
    throw Exception('Failed to load joke');
  }
});
