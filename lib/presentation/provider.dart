import 'package:ambitionguru_task/core/api_services/api_client.dart';
import 'package:ambitionguru_task/model/response_model.dart';
import 'package:flutter/foundation.dart';

class DataProvider with ChangeNotifier {
  ResponseModel response = ResponseModel();
  List<Data> data = [];
  bool isLoading = true;
  // Other state variables as needed
  ApiService apiService = ApiService();
  fetchData() async {
    response = await apiService.fetchData();
    data = response.data!;
    isLoading = false;
    notifyListeners();
  }

  void setApiData(ResponseModel data) {
    response = data;
    isLoading = false;
  }
}
