import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_twitter_web/services/local_storage.dart';

class CafeApi {
  static Dio _dio = Dio();

  static void configureDio() {
    //Base del url
    _dio.options.baseUrl = 'https://flutter-dashboard-admin.herokuapp.com/api';

    //Configurar headers
    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? ''
    };
  }

  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(path);
      return resp.data;
    } on DioError catch (error) {
      throw ('Error en el GET: ${error.response}');
    }
  }

  static Future httpPost(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.post(path, data: formData);
      return resp.data;
    } on DioError catch (error) {
      throw ('Error en el Post: ${error.response}');
    }
  }

  static Future httpPut(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.put(path, data: formData);
      return resp.data;
    } on DioError catch (error) {
      throw ('Error en el Put: ${error.response}');
    }
  }

  static Future httpDelete(String path) async {
    try {
      final resp = await _dio.delete(path);
      return resp.data;
    } on DioError catch (error) {
      throw ('Error en el Delete: ${error.response}');
    }
  }

  static Future httpUploadFile(String path, Uint8List bytes) async {
    final formData =
        FormData.fromMap({'archivo': MultipartFile.fromBytes(bytes)});

    try {
      final resp = await _dio.put(path, data: formData);
      return resp.data;
    } on DioError catch (error) {
      throw ('Error en la carga del Archivo: ${error.response}');
    }
  }
}
