import 'package:dio/dio.dart';

import '../sensitve_data/sensitive_data.dart';

class ApiServices {
  final Dio _dio = Dio(BaseOptions(
      baseUrl: "https://tzhflhqdshribwlaiehi.supabase.co/rest/v1/",
      headers: {
        "apikey": anonKey,
      }));
// ************ GET DATA FROM  SUPABASE *************
  Future<Response> getData(String path) async {
    return await _dio.get(path);
  }

  // ************ INSERT DATA TO SUPABASE *************
  Future<Response> postData(String path, Map<String, dynamic> data) async {
    return await _dio.post(path, data: data);
  }

  // ************ UPDATE DATA FROM SUPABASE *************
  Future<Response> patchData(String path, Map<String, dynamic> data) async {
    return await _dio.patch(path, data: data);
  }

  // ************ DELETE DATA FROM SUPABASE *************
  Future<Response> deleteData(String path) async {
    return await _dio.delete(path);
  }
}
