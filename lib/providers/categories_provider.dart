import 'package:flutter/cupertino.dart';
import 'package:flutter_twitter_web/models/category.dart';
import 'package:flutter_twitter_web/models/http/categories_response.dart';

import '../api/CafeApi.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Categoria> categorias = [];

  getCategories() async {
    final response = await CafeApi.httpGet('/categorias');
    final categoriresResponse = CategoriesResponse.fromMap(response);

    categorias = [...categoriresResponse.categorias];

    notifyListeners();
  }
}
