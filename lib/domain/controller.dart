import 'package:country360/country_model/country_model.dart';
import 'package:country360/domain/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final countryController = FutureProvider<List<CountriesModel>>(
  (ref) async {
    return ref.watch(repoProvider).getWords();
  },
);
