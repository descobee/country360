import 'dart:convert';
import 'dart:developer';

import 'package:country360/country_model/country_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

final repoProvider = Provider<ApiClient>((ref) => ApiClient());

class ApiClient {
  String baseURL = 'https://restcountries.com/v3.1/all';

  Future<List<CountriesModel>> getCountries() async {
    log('Getting Countries...');
    Response response = await get(Uri.parse(baseURL));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map(((e) => CountriesModel.fromJson(e))).toList();
    } else {
      throw Exception();
    }
  }
}
