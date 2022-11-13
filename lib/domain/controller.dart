import 'package:country360/country_model/country_model.dart';
import 'package:country360/domain/repository.dart';
// import 'package:country360/utils/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final countryController = FutureProvider<List<CountriesModel>>(
  (ref) async {
    return ref.watch(repoProvider).getCountries();
  },
);

class CountryControllerClass extends ChangeNotifier {
  CountriesModel? _selectedCountry;

  CountriesModel? get selectedCountry => _selectedCountry;

  setSelectedCountry(CountriesModel selectedCountry) {
    _selectedCountry = selectedCountry;
    notifyListeners();
  }
}
