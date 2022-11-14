import 'package:country360/country_model/country_model.dart';
// import 'package:country360/domain/repository.dart';
import 'package:country360/utils/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final countryController = FutureProvider<List<CountriesModel>>(
  (ref) async {
    return ref.watch(repoProvider).getCountries();
  },
);

final ChangeNotifierProvider<CountryClassController> countryContollerr =
    ChangeNotifierProvider<CountryClassController>(
        (ref) => CountryClassController(ref));

class CountryClassController extends ChangeNotifier {
  Ref ref;
  CountryClassController(this.ref);

  ///>>>>>For themes>>>>>>>///
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void setThemeMode({required bool isDarkMode}) {
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void turnOnDarkMode() {
    setThemeMode(isDarkMode: true);
  }

  void turnOnLightMode() {
    setThemeMode(isDarkMode: false);
  }

  ///>>>>>For themes>>>>>>>///

  List<CountriesModel> _countryList = [];
  CountriesModel? _selectedCountry;

  List<CountriesModel> get countryList => _countryList;
  CountriesModel? get selectedCountry => _selectedCountry;

  setCountriesList(List<CountriesModel> countryList) {
    _countryList = countryList;
    notifyListeners();
  }

  setSelectedCountry(CountriesModel selectedCountry) {
    _selectedCountry = selectedCountry;
    notifyListeners();
  }
}
