// import 'dart:developer';

// import 'package:country360/country_model/country_model.dart';
// import 'package:country360/utils/api_service.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final repoProvider = Provider<CountryRepository>((ref) => CountryRepository());

// class CountryRepository {
//   Future<List<CountriesModel>> getCountries() async {
//     ApiClient client = ApiClient();

//     try {
//       log('Getting countries...');
//       final response = await client.getCountry();
//       if (response.statusCode == 200) {
//         final result = countriesModelFromJson(response.body);
//         log(result.toString());
//         return result;
//       } else {
//         log(response.reasonPhrase.toString());
//         throw Exception();
//       }
//     } catch (e) {
//       throw Exception();
//     }
//   }
// }
