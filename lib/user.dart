import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  final String? name;
  final int? age;

  const User({
    required this.name,
    required this.age,
  });


  User copyWith({  // Reason for using copyWith: To create a new User instance with updated values while keeping the original instance unchanged.
    String? name,
    int? age,
  }) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  @override
  String toString() => 'User(name: $name, age: $age)'; // Reason: To provide a string representation of the User instance
}


class UserNotifier extends StateNotifier<User> {
  UserNotifier() : super(const User(name: '', age: 0));


  void updateName(String newName) { // Reason for using updateName: To update the name of the user while keeping the age unchanged.
    state = state.copyWith(name: newName);
  }

  
  void updateAge(int newAge) { // Reason for using updateAge: To update the age of the user while keeping the name unchanged.
    state = state.copyWith(age: newAge);
  }
}


final userProvider = StateNotifierProvider<UserNotifier, User>((ref) {  // Reason for using StateNotifierProvider: To create a provider that manages the state of the User instance and allows for mutable state updates.
  return UserNotifier();
});