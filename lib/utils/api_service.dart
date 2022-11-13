import 'dart:convert';

import 'package:country360/country_model/country_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

final repoProvider = Provider<ApiClient>((ref) => ApiClient());

class ApiClient {
  String baseURL = 'https://restcountries.com/v3.1/all';

  Future<List<CountriesModel>> getCountries() async {
    Response response = await get(Uri.parse(baseURL));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map(((e) => CountriesModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<Response> getCountry() async {
    final Uri uri = Uri.parse(baseURL);

    try {
      Response response = await get(uri);
      return response;
    } on Exception {
      rethrow;
    }
  }

  // Future<http.Response> get(Uri parse) async {
  //   final sentURL = Uri.parse(baseURL);

  //   http.Response response;

  //   try {
  //     response = await http.get(sentURL);
  //     print(response.toString());
  //   } catch (e) {
  //     rethrow;
  //   }
  //   return response;
  // }
}
