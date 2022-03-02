import 'package:flutter/cupertino.dart';
import 'package:flutter_twitter_web/api/CafeApi.dart';
import 'package:flutter_twitter_web/models/http/users_response.dart';
import 'package:flutter_twitter_web/models/user.dart';

class UsersProvider extends ChangeNotifier {
  List<Usuario> users = [];
  bool isLoading = true;

  UsersProvider() {
    getPaginatedUsers();
  }

  getPaginatedUsers() async {
    final response = await CafeApi.httpGet('/usuarios?limite=100&desde=0');
    final usersResp = UsersResponse.fromMap(response);

    users = [...usersResp.usuarios];
    isLoading = false;
    notifyListeners();
  }
}
