// import 'package:shared_preferences/shared_preferences.dart';

// Future<void> setUserData(Map<String, dynamic> userData) async {
//   final prefs = await SharedPreferences.getInstance();

//   await prefs.setString('user_id', userData['id']);
//   await prefs.setString('name', userData['name']);
//   await prefs.setString('email', userData['email']);
//   await prefs.setString('phone', userData['phone']);

//   print("User data saved in SharedPreferences");
// }

// Future<Map<String, String?>> getUserData() async {
//   final prefs = await SharedPreferences.getInstance();

//   return {
//     'user_id': prefs.getString('user_id'),
//     'name': prefs.getString('user_name'),
//     'email': prefs.getString('user_email'),
//   };
// }
