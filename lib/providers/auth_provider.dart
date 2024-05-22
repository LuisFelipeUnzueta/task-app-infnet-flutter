import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AuthProvider extends ChangeNotifier {
  String? message;
  String? token;

  final _url = 'https://identitytoolkit.googleapis.com/v1/';
  final _resource = 'accounts:';
  final _apiKey = '?key=AIzaSyDv6H9ZsnQnYpzQmUwTclXFlwJ5obZZrJ0';

  Future<bool> authRequest(String email, String password, String action) async {
    void setMessage(String? value) {
      message = value;
      notifyListeners();
    }

    Uri uri = Uri.parse('$_url$_resource$action$_apiKey');
    var response = await http.post(uri, body: {
      'email': email,
      'password': password,
      'returnSecureToken': 'true',
    });
    var resp = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setMessage("Usuário cadastrado com sucesso");
      token = resp["idToken"];
      return true;
    } else {
      setMessage("Erro ao cadastrar o usuário: ${resp['error']['message']}");
      return false;
    }
  }

  Future<bool> signIn(String email, String password) async {
    return authRequest(email, password, 'signInWithPassword');
  }

  Future<bool> signUp(String email, String password) async {
    return authRequest(email, password, 'signUp');
  }
}
