import 'dart:convert';

List<CountriesModel> countriesModelFromJson(String str) =>
    List<CountriesModel>.from(json.decode(str).map((x) => CountriesModel.fromJson(x)));

String countriesModelToJson(List<CountriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountriesModel {
  String? name;
  String? capital;
  String? region;
  dynamic population;
  dynamic area;
  List<String>? timezones;
  Flags? flags;
  List<Currency>? currencies;
  List<Language>? languages;
  String? flag;
  bool? independent;

  CountriesModel({
    this.name,
    this.capital,
    this.region,
    this.population,
    this.area,
    this.timezones,
    this.flags,
    this.currencies,
    this.languages,
    this.flag,
    this.independent,
  });

  factory CountriesModel.fromJson(Map<String, dynamic> json) => CountriesModel(
        name: json["name"],
        capital: json["capital"],
        region: json["region"],
        population: json["population"],
        area: json["area"],
        timezones: json["timezones"] == null
            ? null
            : List<String>.from(json["timezones"].map((x) => x)),
        flags: json["flags"] == null ? null : Flags.fromJson(json["flags"]),
        currencies: json["currencies"] == null
            ? null
            : List<Currency>.from(json["currencies"].map((x) => Currency.fromJson(x))),
        languages: json["languages"] == null
            ? null
            : List<Language>.from(json["languages"].map((x) => Language.fromJson(x))),
        flag: json["flag"],
        independent: json["independent"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "capital": capital,
        "region": region,
        "population": population,
        "area": area,
        "timezones": timezones == null
            ? null
            : List<dynamic>.from(timezones!.map((x) => x)),
        "flags": flags?.toJson(),
        "currencies": currencies == null
            ? null
            : List<dynamic>.from(currencies!.map((x) => x.toJson())),
        "languages": languages == null
            ? null
            : List<dynamic>.from(languages!.map((x) => x.toJson())),
        "flag": flag,
        "independent": independent,
      };
}

class Currency {
  String? code;
  String? name;
  String? symbol;

  Currency({
    this.code,
    this.name,
    this.symbol,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        code: json["code"],
        name: json["name"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "symbol": symbol,
      };
}

class Flags {
  String? svg;
  String? png;

  Flags({
    this.svg,
    this.png,
  });

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        svg: json["svg"],
        png: json["png"],
      );

  Map<String, dynamic> toJson() => {
        "svg": svg,
        "png": png,
      };
}

class Language {
  String? iso6391;
  String? iso6392;
  String? name;
  String? nativeName;

  Language({
    this.iso6391,
    this.iso6392,
    this.name,
    this.nativeName,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        iso6391: json["iso639_1"],
        iso6392: json["iso639_2"],
        name: json["name"],
        nativeName: json["nativeName"],
      );

  Map<String, dynamic> toJson() => {
        "iso639_1": iso6391,
        "iso639_2": iso6392,
        "name": name,
        "nativeName": nativeName,
      };
}
