import 'package:http/http.dart' as http;

class ApiClient {
  http.Client client = http.Client();
  String baseURL = 'https://restcountries.com/v3.1/all';

  Future<http.Response> get() async {
    final sentURL = Uri.parse(baseURL);

    http.Response response;

    try {
      response = await http.get(sentURL);
      print(response.toString());
    } catch (e) {
      rethrow;
    }
    return response;
  }
}
