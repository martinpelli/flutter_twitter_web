import 'package:flutter/cupertino.dart';
import 'package:flutter_twitter_web/router/router.dart';
import 'package:flutter_twitter_web/services/local_storage.dart';
import 'package:flutter_twitter_web/services/navigation_services.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    this.isAuthenticated();
  }

  login(String email, String password) {
    _token = 'ssdadasssssssssssdpaskpdasñdasd';
    LocalStorage.prefs.setString('token', _token!);

    authStatus = AuthStatus.authenticated;
    notifyListeners();

    NavigationService.replaceTo(Flurorouter.dashboardRoute);
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');

    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    await Future.delayed(Duration(milliseconds: 1000));
    authStatus = AuthStatus.authenticated;

    notifyListeners();
    return true;
  }
}
