import 'dart:io';

import 'package:country360/country_model/country_model.dart';
import 'package:country360/utils/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final repoProvider = Provider<CountryRepository>((ref) => CountryRepository());

class CountryRepository {
  Future<List<CountriesModel>> getWords() async {
    ApiClient client = ApiClient();

    final response = await client.get();

    try {
      if (response.statusCode == 200) {
        final result = countriesModelFromJson(response.body);
        return result;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } on SocketException {
      rethrow;
    } on HttpException {
      rethrow;
    } on FormatException {
      rethrow;
    }
  }
}
