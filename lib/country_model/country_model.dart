// To parse this JSON data, do
//
//     final countriesModel = countriesModelFromJson(jsonString);

import 'dart:convert';

List<CountriesModel> countriesModelFromJson(String str) =>
    List<CountriesModel>.from(
        json.decode(str).map((x) => CountriesModel.fromJson(x)));

String countriesModelToJson(List<CountriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountriesModel {
  CountriesModel({
    this.officialName,
    this.commonName,
    this.independent,
    this.currencies,
    this.capital,
    this.region,
    this.subregion,
    this.languages,
    this.area,
    this.population,
    this.timezones,
    this.flags,
    this.coatOfArms,
    this.postalCode,
    this.side,
  });

  String? officialName;
  String? commonName;
  bool? independent;
  Currencies? currencies;
  String? capital;
  String? region;
  String? subregion;
  Map<String, String>? languages;
  double? area;
  double? population;
  String? side;
  List<String>? timezones;
  Flags? flags;
  String? coatOfArms;
  String? postalCode;

  factory CountriesModel.fromJson(Map<String, dynamic> json) => CountriesModel(
        officialName:
            (json["name"] as Map<String, dynamic>)["official"] as String?,
        commonName: (json["name"] as Map<String, dynamic>)["common"] as String?,
        independent: json["independent"],
        currencies: json["currencies"] == null
            ? null
            : Currencies.fromJson(json["currencies"]),
        capital: json["capital"] == null
            ? " "
            : (json["capital"] as List<dynamic>).first as String?,
        region: json["region"],
        subregion: json["subregion"],
        languages: json["languages"] == null
            ? null
            : Map.from(json["languages"])
                .map((k, v) => MapEntry<String, String>(k, v)),
        area: json["area"].toDouble(),
        population: (json["population"] as num).toDouble(),
        side: json["car"] != null
            ? (json["car"] as Map<String, dynamic>)["side"] as String?
            : "",
        timezones: List<String>.from(json["timezones"].map((x) => x)),
        flags: Flags.fromJson(json["flags"]),
        coatOfArms:
            (json["coatOfArms"] as Map<String, dynamic>)["png"] as String?,
        postalCode: json["postalCode"] == null
            ? null
            : (json["postalCode"] as Map<String, dynamic>)["format"],
      );

  Map<String, dynamic> toJson() => {
        "official": officialName,
        "common": commonName,
        "independent": independent,
        "currencies": currencies == null ? null : currencies!.toJson(),
        "capital": capital,
        "region": region,
        "subregion": subregion,
        "languages": languages == null
            ? null
            : Map.from(languages!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "area": area,
        "population": population,
        "side": side,
        "timezones": timezones,
        "flags": flags!.toJson(),
        "png": coatOfArms,
        "postalCode": postalCode,
      };
}

class Currencies {
  Currencies({
    this.mru,
    this.awg,
    this.ars,
    this.sek,
    this.mvr,
    this.mxn,
    this.nzd,
    this.usd,
    this.xpf,
    this.eur,
    this.pkr,
    this.zmw,
    this.scr,
    this.myr,
    this.nok,
    this.uzs,
    this.vuv,
    this.aud,
    this.sgd,
    this.srd,
    this.dzd,
    this.mad,
    this.crc,
    this.lyd,
    this.qar,
    this.dkk,
    this.mur,
    this.kzt,
    this.all,
    this.bhd,
    this.pgk,
    this.bif,
    this.inr,
    this.uyu,
    this.xcd,
    this.bbd,
    this.mop,
    this.gbp,
    this.imp,
    this.syp,
    this.ang,
    this.xof,
    this.kgs,
    this.ttd,
    this.egp,
    this.ils,
    this.jod,
    this.mga,
    this.hrk,
    this.fok,
    this.htg,
    this.ckd,
    this.cuc,
    this.cup,
    this.twd,
    this.szl,
    this.zar,
    this.uah,
    this.bmd,
    this.krw,
    this.pen,
    this.iqd,
    this.mdl,
    this.ves,
    this.gyd,
    this.kyd,
    this.khr,
    this.lkr,
    this.sdg,
    this.ern,
    this.sos,
    this.kmf,
    this.nio,
    this.rub,
    this.ugx,
    this.chf,
    this.tjs,
    this.ssp,
    this.czk,
    this.bwp,
    this.tnd,
    this.jmd,
    this.mzn,
    this.hnl,
    this.azn,
    this.mkd,
    this.gmd,
    this.lrd,
    this.cve,
    this.bsd,
    this.gel,
    this.kid,
    this.tzs,
    this.cny,
    this.gtq,
    this.stn,
    this.sll,
    this.xaf,
    this.thb,
    this.idr,
    this.gip,
    this.tmt,
    this.dop,
    this.ghs,
    this.jep,
    this.currenciesTry,
    this.tvd,
    this.irr,
    this.kes,
    this.bgn,
    this.zwl,
    this.aoa,
    this.ngn,
    this.pln,
    this.shp,
    this.lbp,
    this.wst,
    this.php,
    this.ggp,
    this.kwd,
    this.top,
    this.omr,
    this.afn,
    this.rsd,
    this.amd,
    this.bdt,
    this.lak,
    this.clp,
    this.pab,
    this.npr,
    this.mmk,
    this.fkp,
    this.huf,
    this.gnf,
    this.aed,
    this.bam,
    this.mwk,
    this.btn,
    this.cdf,
    this.vnd,
    this.brl,
    this.bzd,
    this.pyg,
    this.bnd,
    this.bob,
    this.djf,
    this.cad,
    this.jpy,
    this.rwf,
    this.isk,
    this.byn,
    this.hkd,
    this.lsl,
    this.fjd,
    this.cop,
    this.sar,
    this.etb,
    this.kpw,
    this.nad,
    this.mnt,
    this.sbd,
    this.yer,
    this.ron,
  });

  Aed? mru;
  Aed? awg;
  Aed? ars;
  Aed? sek;
  Aed? mvr;
  Aed? mxn;
  Aed? nzd;
  Aed? usd;
  Aed? xpf;
  Aed? eur;
  Aed? pkr;
  Aed? zmw;
  Aed? scr;
  Aed? myr;
  Aed? nok;
  Aed? uzs;
  Aed? vuv;
  Aed? aud;
  Aed? sgd;
  Aed? srd;
  Aed? dzd;
  Aed? mad;
  Aed? crc;
  Aed? lyd;
  Aed? qar;
  Aed? dkk;
  Aed? mur;
  Aed? kzt;
  Aed? all;
  Aed? bhd;
  Aed? pgk;
  Aed? bif;
  Aed? inr;
  Aed? uyu;
  Aed? xcd;
  Aed? bbd;
  Aed? mop;
  Aed? gbp;
  Aed? imp;
  Aed? syp;
  Aed? ang;
  Aed? xof;
  Aed? kgs;
  Aed? ttd;
  Aed? egp;
  Aed? ils;
  Aed? jod;
  Aed? mga;
  Aed? hrk;
  Aed? fok;
  Aed? htg;
  Aed? ckd;
  Aed? cuc;
  Aed? cup;
  Aed? twd;
  Aed? szl;
  Aed? zar;
  Aed? uah;
  Aed? bmd;
  Aed? krw;
  Aed? pen;
  Aed? iqd;
  Aed? mdl;
  Aed? ves;
  Aed? gyd;
  Aed? kyd;
  Aed? khr;
  Aed? lkr;
  Bam? sdg;
  Aed? ern;
  Aed? sos;
  Aed? kmf;
  Aed? nio;
  Aed? rub;
  Aed? ugx;
  Aed? chf;
  Aed? tjs;
  Aed? ssp;
  Aed? czk;
  Aed? bwp;
  Aed? tnd;
  Aed? jmd;
  Aed? mzn;
  Aed? hnl;
  Aed? azn;
  Aed? mkd;
  Aed? gmd;
  Aed? lrd;
  Aed? cve;
  Aed? bsd;
  Aed? gel;
  Aed? kid;
  Aed? tzs;
  Aed? cny;
  Aed? gtq;
  Aed? stn;
  Aed? sll;
  Aed? xaf;
  Aed? thb;
  Aed? idr;
  Aed? gip;
  Aed? tmt;
  Aed? dop;
  Aed? ghs;
  Aed? jep;
  Aed? currenciesTry;
  Aed? tvd;
  Aed? irr;
  Aed? kes;
  Aed? bgn;
  Aed? zwl;
  Aed? aoa;
  Aed? ngn;
  Aed? pln;
  Aed? shp;
  Aed? lbp;
  Aed? wst;
  Aed? php;
  Aed? ggp;
  Aed? kwd;
  Aed? top;
  Aed? omr;
  Aed? afn;
  Aed? rsd;
  Aed? amd;
  Aed? bdt;
  Aed? lak;
  Aed? clp;
  Aed? pab;
  Aed? npr;
  Aed? mmk;
  Aed? fkp;
  Aed? huf;
  Aed? gnf;
  Aed? aed;
  Bam? bam;
  Aed? mwk;
  Aed? btn;
  Aed? cdf;
  Aed? vnd;
  Aed? brl;
  Aed? bzd;
  Aed? pyg;
  Aed? bnd;
  Aed? bob;
  Aed? djf;
  Aed? cad;
  Aed? jpy;
  Aed? rwf;
  Aed? isk;
  Aed? byn;
  Aed? hkd;
  Aed? lsl;
  Aed? fjd;
  Aed? cop;
  Aed? sar;
  Aed? etb;
  Aed? kpw;
  Aed? nad;
  Aed? mnt;
  Aed? sbd;
  Aed? yer;
  Aed? ron;

  factory Currencies.fromJson(Map<String, dynamic> json) => Currencies(
        mru: json["MRU"] == null ? null : Aed.fromJson(json["MRU"]),
        awg: json["AWG"] == null ? null : Aed.fromJson(json["AWG"]),
        ars: json["ARS"] == null ? null : Aed.fromJson(json["ARS"]),
        sek: json["SEK"] == null ? null : Aed.fromJson(json["SEK"]),
        mvr: json["MVR"] == null ? null : Aed.fromJson(json["MVR"]),
        mxn: json["MXN"] == null ? null : Aed.fromJson(json["MXN"]),
        nzd: json["NZD"] == null ? null : Aed.fromJson(json["NZD"]),
        usd: json["USD"] == null ? null : Aed.fromJson(json["USD"]),
        xpf: json["XPF"] == null ? null : Aed.fromJson(json["XPF"]),
        eur: json["EUR"] == null ? null : Aed.fromJson(json["EUR"]),
        pkr: json["PKR"] == null ? null : Aed.fromJson(json["PKR"]),
        zmw: json["ZMW"] == null ? null : Aed.fromJson(json["ZMW"]),
        scr: json["SCR"] == null ? null : Aed.fromJson(json["SCR"]),
        myr: json["MYR"] == null ? null : Aed.fromJson(json["MYR"]),
        nok: json["NOK"] == null ? null : Aed.fromJson(json["NOK"]),
        uzs: json["UZS"] == null ? null : Aed.fromJson(json["UZS"]),
        vuv: json["VUV"] == null ? null : Aed.fromJson(json["VUV"]),
        aud: json["AUD"] == null ? null : Aed.fromJson(json["AUD"]),
        sgd: json["SGD"] == null ? null : Aed.fromJson(json["SGD"]),
        srd: json["SRD"] == null ? null : Aed.fromJson(json["SRD"]),
        dzd: json["DZD"] == null ? null : Aed.fromJson(json["DZD"]),
        mad: json["MAD"] == null ? null : Aed.fromJson(json["MAD"]),
        crc: json["CRC"] == null ? null : Aed.fromJson(json["CRC"]),
        lyd: json["LYD"] == null ? null : Aed.fromJson(json["LYD"]),
        qar: json["QAR"] == null ? null : Aed.fromJson(json["QAR"]),
        dkk: json["DKK"] == null ? null : Aed.fromJson(json["DKK"]),
        mur: json["MUR"] == null ? null : Aed.fromJson(json["MUR"]),
        kzt: json["KZT"] == null ? null : Aed.fromJson(json["KZT"]),
        all: json["ALL"] == null ? null : Aed.fromJson(json["ALL"]),
        bhd: json["BHD"] == null ? null : Aed.fromJson(json["BHD"]),
        pgk: json["PGK"] == null ? null : Aed.fromJson(json["PGK"]),
        bif: json["BIF"] == null ? null : Aed.fromJson(json["BIF"]),
        inr: json["INR"] == null ? null : Aed.fromJson(json["INR"]),
        uyu: json["UYU"] == null ? null : Aed.fromJson(json["UYU"]),
        xcd: json["XCD"] == null ? null : Aed.fromJson(json["XCD"]),
        bbd: json["BBD"] == null ? null : Aed.fromJson(json["BBD"]),
        mop: json["MOP"] == null ? null : Aed.fromJson(json["MOP"]),
        gbp: json["GBP"] == null ? null : Aed.fromJson(json["GBP"]),
        imp: json["IMP"] == null ? null : Aed.fromJson(json["IMP"]),
        syp: json["SYP"] == null ? null : Aed.fromJson(json["SYP"]),
        ang: json["ANG"] == null ? null : Aed.fromJson(json["ANG"]),
        xof: json["XOF"] == null ? null : Aed.fromJson(json["XOF"]),
        kgs: json["KGS"] == null ? null : Aed.fromJson(json["KGS"]),
        ttd: json["TTD"] == null ? null : Aed.fromJson(json["TTD"]),
        egp: json["EGP"] == null ? null : Aed.fromJson(json["EGP"]),
        ils: json["ILS"] == null ? null : Aed.fromJson(json["ILS"]),
        jod: json["JOD"] == null ? null : Aed.fromJson(json["JOD"]),
        mga: json["MGA"] == null ? null : Aed.fromJson(json["MGA"]),
        hrk: json["HRK"] == null ? null : Aed.fromJson(json["HRK"]),
        fok: json["FOK"] == null ? null : Aed.fromJson(json["FOK"]),
        htg: json["HTG"] == null ? null : Aed.fromJson(json["HTG"]),
        ckd: json["CKD"] == null ? null : Aed.fromJson(json["CKD"]),
        cuc: json["CUC"] == null ? null : Aed.fromJson(json["CUC"]),
        cup: json["CUP"] == null ? null : Aed.fromJson(json["CUP"]),
        twd: json["TWD"] == null ? null : Aed.fromJson(json["TWD"]),
        szl: json["SZL"] == null ? null : Aed.fromJson(json["SZL"]),
        zar: json["ZAR"] == null ? null : Aed.fromJson(json["ZAR"]),
        uah: json["UAH"] == null ? null : Aed.fromJson(json["UAH"]),
        bmd: json["BMD"] == null ? null : Aed.fromJson(json["BMD"]),
        krw: json["KRW"] == null ? null : Aed.fromJson(json["KRW"]),
        pen: json["PEN"] == null ? null : Aed.fromJson(json["PEN"]),
        iqd: json["IQD"] == null ? null : Aed.fromJson(json["IQD"]),
        mdl: json["MDL"] == null ? null : Aed.fromJson(json["MDL"]),
        ves: json["VES"] == null ? null : Aed.fromJson(json["VES"]),
        gyd: json["GYD"] == null ? null : Aed.fromJson(json["GYD"]),
        kyd: json["KYD"] == null ? null : Aed.fromJson(json["KYD"]),
        khr: json["KHR"] == null ? null : Aed.fromJson(json["KHR"]),
        lkr: json["LKR"] == null ? null : Aed.fromJson(json["LKR"]),
        sdg: json["SDG"] == null ? null : Bam.fromJson(json["SDG"]),
        ern: json["ERN"] == null ? null : Aed.fromJson(json["ERN"]),
        sos: json["SOS"] == null ? null : Aed.fromJson(json["SOS"]),
        kmf: json["KMF"] == null ? null : Aed.fromJson(json["KMF"]),
        nio: json["NIO"] == null ? null : Aed.fromJson(json["NIO"]),
        rub: json["RUB"] == null ? null : Aed.fromJson(json["RUB"]),
        ugx: json["UGX"] == null ? null : Aed.fromJson(json["UGX"]),
        chf: json["CHF"] == null ? null : Aed.fromJson(json["CHF"]),
        tjs: json["TJS"] == null ? null : Aed.fromJson(json["TJS"]),
        ssp: json["SSP"] == null ? null : Aed.fromJson(json["SSP"]),
        czk: json["CZK"] == null ? null : Aed.fromJson(json["CZK"]),
        bwp: json["BWP"] == null ? null : Aed.fromJson(json["BWP"]),
        tnd: json["TND"] == null ? null : Aed.fromJson(json["TND"]),
        jmd: json["JMD"] == null ? null : Aed.fromJson(json["JMD"]),
        mzn: json["MZN"] == null ? null : Aed.fromJson(json["MZN"]),
        hnl: json["HNL"] == null ? null : Aed.fromJson(json["HNL"]),
        azn: json["AZN"] == null ? null : Aed.fromJson(json["AZN"]),
        mkd: json["MKD"] == null ? null : Aed.fromJson(json["MKD"]),
        gmd: json["GMD"] == null ? null : Aed.fromJson(json["GMD"]),
        lrd: json["LRD"] == null ? null : Aed.fromJson(json["LRD"]),
        cve: json["CVE"] == null ? null : Aed.fromJson(json["CVE"]),
        bsd: json["BSD"] == null ? null : Aed.fromJson(json["BSD"]),
        gel: json["GEL"] == null ? null : Aed.fromJson(json["GEL"]),
        kid: json["KID"] == null ? null : Aed.fromJson(json["KID"]),
        tzs: json["TZS"] == null ? null : Aed.fromJson(json["TZS"]),
        cny: json["CNY"] == null ? null : Aed.fromJson(json["CNY"]),
        gtq: json["GTQ"] == null ? null : Aed.fromJson(json["GTQ"]),
        stn: json["STN"] == null ? null : Aed.fromJson(json["STN"]),
        sll: json["SLL"] == null ? null : Aed.fromJson(json["SLL"]),
        xaf: json["XAF"] == null ? null : Aed.fromJson(json["XAF"]),
        thb: json["THB"] == null ? null : Aed.fromJson(json["THB"]),
        idr: json["IDR"] == null ? null : Aed.fromJson(json["IDR"]),
        gip: json["GIP"] == null ? null : Aed.fromJson(json["GIP"]),
        tmt: json["TMT"] == null ? null : Aed.fromJson(json["TMT"]),
        dop: json["DOP"] == null ? null : Aed.fromJson(json["DOP"]),
        ghs: json["GHS"] == null ? null : Aed.fromJson(json["GHS"]),
        jep: json["JEP"] == null ? null : Aed.fromJson(json["JEP"]),
        currenciesTry: json["TRY"] == null ? null : Aed.fromJson(json["TRY"]),
        tvd: json["TVD"] == null ? null : Aed.fromJson(json["TVD"]),
        irr: json["IRR"] == null ? null : Aed.fromJson(json["IRR"]),
        kes: json["KES"] == null ? null : Aed.fromJson(json["KES"]),
        bgn: json["BGN"] == null ? null : Aed.fromJson(json["BGN"]),
        zwl: json["ZWL"] == null ? null : Aed.fromJson(json["ZWL"]),
        aoa: json["AOA"] == null ? null : Aed.fromJson(json["AOA"]),
        ngn: json["NGN"] == null ? null : Aed.fromJson(json["NGN"]),
        pln: json["PLN"] == null ? null : Aed.fromJson(json["PLN"]),
        shp: json["SHP"] == null ? null : Aed.fromJson(json["SHP"]),
        lbp: json["LBP"] == null ? null : Aed.fromJson(json["LBP"]),
        wst: json["WST"] == null ? null : Aed.fromJson(json["WST"]),
        php: json["PHP"] == null ? null : Aed.fromJson(json["PHP"]),
        ggp: json["GGP"] == null ? null : Aed.fromJson(json["GGP"]),
        kwd: json["KWD"] == null ? null : Aed.fromJson(json["KWD"]),
        top: json["TOP"] == null ? null : Aed.fromJson(json["TOP"]),
        omr: json["OMR"] == null ? null : Aed.fromJson(json["OMR"]),
        afn: json["AFN"] == null ? null : Aed.fromJson(json["AFN"]),
        rsd: json["RSD"] == null ? null : Aed.fromJson(json["RSD"]),
        amd: json["AMD"] == null ? null : Aed.fromJson(json["AMD"]),
        bdt: json["BDT"] == null ? null : Aed.fromJson(json["BDT"]),
        lak: json["LAK"] == null ? null : Aed.fromJson(json["LAK"]),
        clp: json["CLP"] == null ? null : Aed.fromJson(json["CLP"]),
        pab: json["PAB"] == null ? null : Aed.fromJson(json["PAB"]),
        npr: json["NPR"] == null ? null : Aed.fromJson(json["NPR"]),
        mmk: json["MMK"] == null ? null : Aed.fromJson(json["MMK"]),
        fkp: json["FKP"] == null ? null : Aed.fromJson(json["FKP"]),
        huf: json["HUF"] == null ? null : Aed.fromJson(json["HUF"]),
        gnf: json["GNF"] == null ? null : Aed.fromJson(json["GNF"]),
        aed: json["AED"] == null ? null : Aed.fromJson(json["AED"]),
        bam: json["BAM"] == null ? null : Bam.fromJson(json["BAM"]),
        mwk: json["MWK"] == null ? null : Aed.fromJson(json["MWK"]),
        btn: json["BTN"] == null ? null : Aed.fromJson(json["BTN"]),
        cdf: json["CDF"] == null ? null : Aed.fromJson(json["CDF"]),
        vnd: json["VND"] == null ? null : Aed.fromJson(json["VND"]),
        brl: json["BRL"] == null ? null : Aed.fromJson(json["BRL"]),
        bzd: json["BZD"] == null ? null : Aed.fromJson(json["BZD"]),
        pyg: json["PYG"] == null ? null : Aed.fromJson(json["PYG"]),
        bnd: json["BND"] == null ? null : Aed.fromJson(json["BND"]),
        bob: json["BOB"] == null ? null : Aed.fromJson(json["BOB"]),
        djf: json["DJF"] == null ? null : Aed.fromJson(json["DJF"]),
        cad: json["CAD"] == null ? null : Aed.fromJson(json["CAD"]),
        jpy: json["JPY"] == null ? null : Aed.fromJson(json["JPY"]),
        rwf: json["RWF"] == null ? null : Aed.fromJson(json["RWF"]),
        isk: json["ISK"] == null ? null : Aed.fromJson(json["ISK"]),
        byn: json["BYN"] == null ? null : Aed.fromJson(json["BYN"]),
        hkd: json["HKD"] == null ? null : Aed.fromJson(json["HKD"]),
        lsl: json["LSL"] == null ? null : Aed.fromJson(json["LSL"]),
        fjd: json["FJD"] == null ? null : Aed.fromJson(json["FJD"]),
        cop: json["COP"] == null ? null : Aed.fromJson(json["COP"]),
        sar: json["SAR"] == null ? null : Aed.fromJson(json["SAR"]),
        etb: json["ETB"] == null ? null : Aed.fromJson(json["ETB"]),
        kpw: json["KPW"] == null ? null : Aed.fromJson(json["KPW"]),
        nad: json["NAD"] == null ? null : Aed.fromJson(json["NAD"]),
        mnt: json["MNT"] == null ? null : Aed.fromJson(json["MNT"]),
        sbd: json["SBD"] == null ? null : Aed.fromJson(json["SBD"]),
        yer: json["YER"] == null ? null : Aed.fromJson(json["YER"]),
        ron: json["RON"] == null ? null : Aed.fromJson(json["RON"]),
      );

  Map<String, dynamic> toJson() => {
        "MRU": mru == null ? null : mru!.toJson(),
        "AWG": awg == null ? null : awg!.toJson(),
        "ARS": ars == null ? null : ars!.toJson(),
        "SEK": sek == null ? null : sek!.toJson(),
        "MVR": mvr == null ? null : mvr!.toJson(),
        "MXN": mxn == null ? null : mxn!.toJson(),
        "NZD": nzd == null ? null : nzd!.toJson(),
        "USD": usd == null ? null : usd!.toJson(),
        "XPF": xpf == null ? null : xpf!.toJson(),
        "EUR": eur == null ? null : eur!.toJson(),
        "PKR": pkr == null ? null : pkr!.toJson(),
        "ZMW": zmw == null ? null : zmw!.toJson(),
        "SCR": scr == null ? null : scr!.toJson(),
        "MYR": myr == null ? null : myr!.toJson(),
        "NOK": nok == null ? null : nok!.toJson(),
        "UZS": uzs == null ? null : uzs!.toJson(),
        "VUV": vuv == null ? null : vuv!.toJson(),
        "AUD": aud == null ? null : aud!.toJson(),
        "SGD": sgd == null ? null : sgd!.toJson(),
        "SRD": srd == null ? null : srd!.toJson(),
        "DZD": dzd == null ? null : dzd!.toJson(),
        "MAD": mad == null ? null : mad!.toJson(),
        "CRC": crc == null ? null : crc!.toJson(),
        "LYD": lyd == null ? null : lyd!.toJson(),
        "QAR": qar == null ? null : qar!.toJson(),
        "DKK": dkk == null ? null : dkk!.toJson(),
        "MUR": mur == null ? null : mur!.toJson(),
        "KZT": kzt == null ? null : kzt!.toJson(),
        "ALL": all == null ? null : all!.toJson(),
        "BHD": bhd == null ? null : bhd!.toJson(),
        "PGK": pgk == null ? null : pgk!.toJson(),
        "BIF": bif == null ? null : bif!.toJson(),
        "INR": inr == null ? null : inr!.toJson(),
        "UYU": uyu == null ? null : uyu!.toJson(),
        "XCD": xcd == null ? null : xcd!.toJson(),
        "BBD": bbd == null ? null : bbd!.toJson(),
        "MOP": mop == null ? null : mop!.toJson(),
        "GBP": gbp == null ? null : gbp!.toJson(),
        "IMP": imp == null ? null : imp!.toJson(),
        "SYP": syp == null ? null : syp!.toJson(),
        "ANG": ang == null ? null : ang!.toJson(),
        "XOF": xof == null ? null : xof!.toJson(),
        "KGS": kgs == null ? null : kgs!.toJson(),
        "TTD": ttd == null ? null : ttd!.toJson(),
        "EGP": egp == null ? null : egp!.toJson(),
        "ILS": ils == null ? null : ils!.toJson(),
        "JOD": jod == null ? null : jod!.toJson(),
        "MGA": mga == null ? null : mga!.toJson(),
        "HRK": hrk == null ? null : hrk!.toJson(),
        "FOK": fok == null ? null : fok!.toJson(),
        "HTG": htg == null ? null : htg!.toJson(),
        "CKD": ckd == null ? null : ckd!.toJson(),
        "CUC": cuc == null ? null : cuc!.toJson(),
        "CUP": cup == null ? null : cup!.toJson(),
        "TWD": twd == null ? null : twd!.toJson(),
        "SZL": szl == null ? null : szl!.toJson(),
        "ZAR": zar == null ? null : zar!.toJson(),
        "UAH": uah == null ? null : uah!.toJson(),
        "BMD": bmd == null ? null : bmd!.toJson(),
        "KRW": krw == null ? null : krw!.toJson(),
        "PEN": pen == null ? null : pen!.toJson(),
        "IQD": iqd == null ? null : iqd!.toJson(),
        "MDL": mdl == null ? null : mdl!.toJson(),
        "VES": ves == null ? null : ves!.toJson(),
        "GYD": gyd == null ? null : gyd!.toJson(),
        "KYD": kyd == null ? null : kyd!.toJson(),
        "KHR": khr == null ? null : khr!.toJson(),
        "LKR": lkr == null ? null : lkr!.toJson(),
        "SDG": sdg == null ? null : sdg!.toJson(),
        "ERN": ern == null ? null : ern!.toJson(),
        "SOS": sos == null ? null : sos!.toJson(),
        "KMF": kmf == null ? null : kmf!.toJson(),
        "NIO": nio == null ? null : nio!.toJson(),
        "RUB": rub == null ? null : rub!.toJson(),
        "UGX": ugx == null ? null : ugx!.toJson(),
        "CHF": chf == null ? null : chf!.toJson(),
        "TJS": tjs == null ? null : tjs!.toJson(),
        "SSP": ssp == null ? null : ssp!.toJson(),
        "CZK": czk == null ? null : czk!.toJson(),
        "BWP": bwp == null ? null : bwp!.toJson(),
        "TND": tnd == null ? null : tnd!.toJson(),
        "JMD": jmd == null ? null : jmd!.toJson(),
        "MZN": mzn == null ? null : mzn!.toJson(),
        "HNL": hnl == null ? null : hnl!.toJson(),
        "AZN": azn == null ? null : azn!.toJson(),
        "MKD": mkd == null ? null : mkd!.toJson(),
        "GMD": gmd == null ? null : gmd!.toJson(),
        "LRD": lrd == null ? null : lrd!.toJson(),
        "CVE": cve == null ? null : cve!.toJson(),
        "BSD": bsd == null ? null : bsd!.toJson(),
        "GEL": gel == null ? null : gel!.toJson(),
        "KID": kid == null ? null : kid!.toJson(),
        "TZS": tzs == null ? null : tzs!.toJson(),
        "CNY": cny == null ? null : cny!.toJson(),
        "GTQ": gtq == null ? null : gtq!.toJson(),
        "STN": stn == null ? null : stn!.toJson(),
        "SLL": sll == null ? null : sll!.toJson(),
        "XAF": xaf == null ? null : xaf!.toJson(),
        "THB": thb == null ? null : thb!.toJson(),
        "IDR": idr == null ? null : idr!.toJson(),
        "GIP": gip == null ? null : gip!.toJson(),
        "TMT": tmt == null ? null : tmt!.toJson(),
        "DOP": dop == null ? null : dop!.toJson(),
        "GHS": ghs == null ? null : ghs!.toJson(),
        "JEP": jep == null ? null : jep!.toJson(),
        "TRY": currenciesTry == null ? null : currenciesTry!.toJson(),
        "TVD": tvd == null ? null : tvd!.toJson(),
        "IRR": irr == null ? null : irr!.toJson(),
        "KES": kes == null ? null : kes!.toJson(),
        "BGN": bgn == null ? null : bgn!.toJson(),
        "ZWL": zwl == null ? null : zwl!.toJson(),
        "AOA": aoa == null ? null : aoa!.toJson(),
        "NGN": ngn == null ? null : ngn!.toJson(),
        "PLN": pln == null ? null : pln!.toJson(),
        "SHP": shp == null ? null : shp!.toJson(),
        "LBP": lbp == null ? null : lbp!.toJson(),
        "WST": wst == null ? null : wst!.toJson(),
        "PHP": php == null ? null : php!.toJson(),
        "GGP": ggp == null ? null : ggp!.toJson(),
        "KWD": kwd == null ? null : kwd!.toJson(),
        "TOP": top == null ? null : top!.toJson(),
        "OMR": omr == null ? null : omr!.toJson(),
        "AFN": afn == null ? null : afn!.toJson(),
        "RSD": rsd == null ? null : rsd!.toJson(),
        "AMD": amd == null ? null : amd!.toJson(),
        "BDT": bdt == null ? null : bdt!.toJson(),
        "LAK": lak == null ? null : lak!.toJson(),
        "CLP": clp == null ? null : clp!.toJson(),
        "PAB": pab == null ? null : pab!.toJson(),
        "NPR": npr == null ? null : npr!.toJson(),
        "MMK": mmk == null ? null : mmk!.toJson(),
        "FKP": fkp == null ? null : fkp!.toJson(),
        "HUF": huf == null ? null : huf!.toJson(),
        "GNF": gnf == null ? null : gnf!.toJson(),
        "AED": aed == null ? null : aed!.toJson(),
        "BAM": bam == null ? null : bam!.toJson(),
        "MWK": mwk == null ? null : mwk!.toJson(),
        "BTN": btn == null ? null : btn!.toJson(),
        "CDF": cdf == null ? null : cdf!.toJson(),
        "VND": vnd == null ? null : vnd!.toJson(),
        "BRL": brl == null ? null : brl!.toJson(),
        "BZD": bzd == null ? null : bzd!.toJson(),
        "PYG": pyg == null ? null : pyg!.toJson(),
        "BND": bnd == null ? null : bnd!.toJson(),
        "BOB": bob == null ? null : bob!.toJson(),
        "DJF": djf == null ? null : djf!.toJson(),
        "CAD": cad == null ? null : cad!.toJson(),
        "JPY": jpy == null ? null : jpy!.toJson(),
        "RWF": rwf == null ? null : rwf!.toJson(),
        "ISK": isk == null ? null : isk!.toJson(),
        "BYN": byn == null ? null : byn!.toJson(),
        "HKD": hkd == null ? null : hkd!.toJson(),
        "LSL": lsl == null ? null : lsl!.toJson(),
        "FJD": fjd == null ? null : fjd!.toJson(),
        "COP": cop == null ? null : cop!.toJson(),
        "SAR": sar == null ? null : sar!.toJson(),
        "ETB": etb == null ? null : etb!.toJson(),
        "KPW": kpw == null ? null : kpw!.toJson(),
        "NAD": nad == null ? null : nad!.toJson(),
        "MNT": mnt == null ? null : mnt!.toJson(),
        "SBD": sbd == null ? null : sbd!.toJson(),
        "YER": yer == null ? null : yer!.toJson(),
        "RON": ron == null ? null : ron!.toJson(),
      };
}

class Aed {
  Aed({
    this.name,
    this.symbol,
  });

  String? name;
  String? symbol;

  factory Aed.fromJson(Map<String, dynamic> json) => Aed(
        name: json["name"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "symbol": symbol,
      };
}

class Bam {
  Bam({
    this.name,
  });

  String? name;

  factory Bam.fromJson(Map<String, dynamic> json) => Bam(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Flags {
  Flags({
    this.png,
    this.svg,
  });

  String? png;
  String? svg;

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        png: json["png"],
        svg: json["svg"],
      );

  Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
      };
}
