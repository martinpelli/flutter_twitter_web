import 'package:flutter/cupertino.dart';
import 'package:flutter_twitter_web/api/CafeApi.dart';
import 'package:flutter_twitter_web/models/http/users_response.dart';
import 'package:flutter_twitter_web/models/user.dart';

class UsersProvider extends ChangeNotifier {
  List<Usuario> users = [];
  bool isLoading = true;
  bool ascending = true;
  int? sortColumnIndex;

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

  Future<Usuario> getUserById(String uid) async {
    try {
      final response = await CafeApi.httpGet('/usuarios/$uid');
      final user = Usuario.fromMap(response);
      return user;
    } catch (error) {
      throw error;
    }
  }

  void sort<T>(Comparable<T> Function(Usuario user) getField) {
    users.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);

      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });

    ascending = !ascending;

    notifyListeners();
  }
}
