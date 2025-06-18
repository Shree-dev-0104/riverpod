class Joke {
  final String setup;
  final String punchline;

  Joke({required this.setup, required this.punchline});

  factory Joke.fromJson(Map<String, dynamic> json) {  // reason for using fromJson: To create a Joke instance from a JSON object, allowing for easy deserialization of data received from an API.
    return Joke(         // factory constructor is used to create an instance of Joke from a JSON map.
      setup: json['setup'],
      punchline: json['punchline'],
    );
  }
}
