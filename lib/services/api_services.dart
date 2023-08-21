import 'dart:convert';
import 'dart:developer';
import 'package:assignment_1/model/about_model.dart';
import 'package:assignment_1/model/book_model.dart';
import 'package:assignment_1/services/status_code.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  String apiScreen = "ApIScreen";
  String aboutScreen = "aboutScreen";

  Future data(String url, String label) async {
    List<BookData> data = [];
    List<AboutModel> aboutData = [];
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == ServerStatusCodes.SUCESS && label == apiScreen) {
      var jsonData = jsonDecode(response.body)['bookItem'];
      log(jsonData.toString());
      for (Map<String, dynamic> i in jsonData) {
        data.add(BookData.fromJson(i));
      }
      return data;
    } else if (response.statusCode == ServerStatusCodes.SUCESS && label == aboutScreen) {
      var jsonData = jsonDecode(response.body);
      log(jsonData.toString());
       aboutData.add(AboutModel.fromJson(jsonData));
       return aboutData;
    } else {
      log(response.statusCode.toString());
    }
  }
}
