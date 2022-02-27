import 'package:dio/dio.dart';
import 'package:flutter_twitter_web/services/local_storage.dart';

class CafeApi {
  static Dio _dio = Dio();

  static void configureDio() {
    //Base del url
    _dio.options.baseUrl = 'http://localhost:8080/api';

    //Configurar headers
    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? ''
    };
  }

  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(path);
      return resp.data;
    } catch (e) {
      throw ('Error en el GET');
    }
  }

  static Future httpPost(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.post(path, data: formData);
      return resp.data;
    } catch (e) {
      throw ('Error en el Post');
    }
  }

  static Future httpPut(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.put(path, data: formData);
      return resp.data;
    } catch (e) {
      throw ('Error en el Put');
    }
  }

  static Future httpDelete(String path) async {
    try {
      final resp = await _dio.delete(path);
      return resp.data;
    } catch (e) {
      throw ('Error en el Delete');
    }
  }
}
