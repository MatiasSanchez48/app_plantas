import 'dart:convert';

import 'package:app_plantas/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// TODO: Add description.
class SharedPreferencesHelper {
  static Future<SharedPreferences> getInstance() async {
    final pref = await SharedPreferences.getInstance();
    return pref;
  }

  static Future<bool> clearUser() async {
    final pref = await getInstance();
    return pref.remove('usuario');
  }

  Future<bool> saveUser(User user) async {
    final pref = await getInstance();
    final userJson = jsonEncode(user.toJson());
    final saved = await pref.setString('usuario', userJson);
    return saved;
  }

  Future<User?> getUser() async {
    final pref = await getInstance();
    final userJson = pref.getString('usuario');

    if (userJson != null) {
      final userMap = jsonDecode(userJson) as Map<String, dynamic>;
      final user = User.fromJson(userMap);
      return user;
    }

    return null;
  }
}
