import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  final String? name;
  final int? age;

  const User({
    required this.name,
    required this.age,
  });

  
  User copyWith({
    String? name,
    int? age,
  }) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  @override
  String toString() => 'User(name: $name, age: $age)';
}


class UserNotifier extends StateNotifier<User> {
  UserNotifier() : super(const User(name: '', age: 0));


  void updateName(String newName) {
    state = state.copyWith(name: newName);
  }

  
  void updateAge(int newAge) {
    state = state.copyWith(age: newAge);
  }
}


final userProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier();
});