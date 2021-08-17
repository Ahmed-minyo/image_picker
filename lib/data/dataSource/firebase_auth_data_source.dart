import 'dart:convert';
import 'package:http/http.dart' as http;


class FirebaseAuthDataSource {
  Future<void> signUp(String email, String password) async {
    final url =
    Uri.parse('https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=AIzaSyCwbQA0uYegYVepG0XGLJJ05HViqz5aypQ');
    await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
  }

  Future<void> login(String email, String password) async {
    final url =
    Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCwbQA0uYegYVepG0XGLJJ05HViqz5aypQ');
    await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
  }
}