import 'package:flutter/cupertino.dart';
import 'package:flutter_twitter_web/api/CafeApi.dart';
import 'package:flutter_twitter_web/models/user.dart';

class UserFormProvider extends ChangeNotifier {
  Usuario? user;
  late GlobalKey<FormState> formKey;

  bool _validForm() {
    return formKey.currentState!.validate();
  }

  // void updateListeners() {
  //   notifyListeners();
//}

  copyUserWith({
    String? rol,
    bool? estado,
    bool? google,
    String? nombre,
    String? correo,
    String? uid,
    String? img,
  }) {
    user = Usuario(
        rol: rol ?? user!.rol,
        estado: estado ?? user!.estado,
        google: google ?? user!.google,
        nombre: nombre ?? user!.nombre,
        correo: correo ?? user!.correo,
        uid: uid ?? user!.uid);
    notifyListeners();
  }

  Future<bool> updateUser() async {
    if (!_validForm()) return false;

    final data = {'nombre': user!.nombre, 'correo': user!.correo};

    try {
      final response = await CafeApi.httpPut('/usuarios/${user!.uid}', data);
      return true;
    } catch (error) {
      return false;
    }
  }
}
