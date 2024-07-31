import 'dart:convert';
import 'package:ambitionguru_task/model/response_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = 'https://api.ambition.guru/api/blogs/fetch';

  Future<ResponseModel> fetchData() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      print("Data Fetched Successfully");

      return ResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
