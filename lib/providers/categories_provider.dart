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

  Future newCategory(String name) async {
    final data = {'nombre': name};
    try {
      final json = await CafeApi.httpPost('/categorias', data);
      final newCategory = Categoria.fromMap(json);

      categorias.add(newCategory);
      notifyListeners();
    } catch (error) {
      throw 'Error al crear la categoría';
    }
  }

  Future updateCategory(String id, String name) async {
    final data = {'nombre': name};
    try {
      await CafeApi.httpPut('/categorias/$id', data);
      categorias = categorias.map((category) {
        if (category.id != id) return category;
        category.nombre = name;
        return category;
      }).toList();
      notifyListeners();
    } catch (error) {
      throw 'Error al actualizar la categoría';
    }
  }

  Future deleteCategory(String id) async {
    try {
      await CafeApi.httpDelete('/categorias/$id');
      categorias.removeWhere((categoria) => categoria.id == id);
      notifyListeners();
    } catch (error) {}
  }
}
