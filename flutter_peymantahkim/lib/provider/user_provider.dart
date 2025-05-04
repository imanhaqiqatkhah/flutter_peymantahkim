import 'package:flutter_peymantahkim/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProvider extends StateNotifier<User?> {
  // constructor initializing with default user object
  // purpose: manage the state of the user object updates
  UserProvider()
      : super(User(
            id: '',
            fullName: '',
            email: '',
            state: '',
            city: '',
            locality: '',
            password: '',
            token: ''));

  // getter method to extract value from an object

  User? get user => state;

  // method to set user state from Json
  // purpose: update he user state base on json string representation of user object

  void setUser(String userJson) {
    state = User.fromJson(userJson);
  }
}

// make the data accessability within the application
final userProvider =
    StateNotifierProvider<UserProvider, User?>((ref) => UserProvider());
