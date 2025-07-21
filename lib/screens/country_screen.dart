import 'dart:developer';

import 'package:country360/country_model/country_model.dart';
import 'package:country360/domain/controller.dart';
import 'package:country360/screens/country_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController controller = TextEditingController();

  List<CountriesModel>? filteredCountries;

  void filterList(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredCountries = null;
      });
      return;
    }

    final List<CountriesModel> countries = ref
        .watch(countryContollerr)
        .countryList; //countriesModel is the list of the country model
    final List<CountriesModel> newItems =
        List.generate(countries.length, (index) => countries[index]);
    setState(() {
      filteredCountries = newItems
          .where((e) => e.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Iterable<CountriesModel> reduceList() {
    final counCont = ref.watch(countryController);
    counCont.when(
        data: (data) {
          List<CountriesModel> countries = data.map((e) => e).toList();
          countries.sort(
            (a, b) {
              return a.name!.toLowerCase().compareTo(b.name!.toLowerCase());
            },
          );
          final ccc = ref.read(countryContollerr);
          ccc.countryList.clear();
          ccc.countryList.addAll(countries);
        },
        error: (error, _) => log(error.toString()),
        loading: () => log('Loading'));

    return filteredCountries ?? ref.watch(countryContollerr).countryList;
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    final controllerCountry = ref.watch(countryController);
    final ccc = ref.watch(countryContollerr);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 500,
          toolbarHeight: 80,
          leading: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Explore',
                  style: GoogleFonts.elsieSwashCaps(
                      fontSize: 24,
                      color: colorTheme.surface,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                '.',
                style: GoogleFonts.elsieSwashCaps(
                    fontSize: 30,
                    color: colorTheme.error,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorTheme.secondary,
                ),
                child: Theme.of(context).brightness == Brightness.dark
                    ? IconButton(
                        onPressed: ccc.turnOnLightMode,
                        icon: Icon(
                          Icons.dark_mode_sharp,
                          color: colorTheme.surface,
                          size: 25,
                        ),
                      )
                    : IconButton(
                        onPressed: ccc.turnOnDarkMode,
                        color: colorTheme.surface,
                        icon: const Icon(Icons.light_mode, size: 25),
                      ),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: size.width,
                  decoration: BoxDecoration(
                    color: colorTheme.secondary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    onChanged: (v) => filterList(v),
                    textAlign: TextAlign.center,
                    controller: controller,
                    style: const TextStyle(
                      fontFamily: 'Axiforma',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 15),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 20,
                        ),
                        fillColor: colorTheme.secondary,
                        hintText: 'Search Country',
                        hintStyle: textTheme.bodyMedium,
                        focusedBorder: InputBorder.none),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Container(
                //       padding: const EdgeInsets.all(8),
                //       decoration: BoxDecoration(
                //         border: Border.all(color: colorTheme.secondary),
                //         borderRadius: BorderRadius.circular(5),
                //       ),
                //       child: Row(
                //         children: [
                //           SvgPicture.asset(
                //             'assets/svgs/globe-913.svg',
                //             color: colorTheme.primary,
                //             height: 10,
                //             width: 10,
                //           ),
                //           const SizedBox(
                //             width: 5,
                //           ),
                //           const Text('EN'),
                //         ],
                //       ),
                //     ),
                //     Container(
                //       padding: const EdgeInsets.all(8),
                //       decoration: BoxDecoration(
                //         border: Border.all(color: colorTheme.secondary),
                //         borderRadius: BorderRadius.circular(5),
                //       ),
                //       child: Row(
                //         children: [
                //           SvgPicture.asset(
                //             'assets/svgs/filter-svgrepo-com.svg',
                //             color: colorTheme.primary,
                //             height: 10,
                //             width: 10,
                //           ),
                //           const SizedBox(
                //             width: 10,
                //           ),
                //           const Text('Filter'),
                //         ],
                //       ),
                //     )
                //   ],
                // ),
                
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () {
                      return ref.refresh(countryController.future);
                    },
                    color: colorTheme.surface,
                    backgroundColor: Colors.transparent,
                    child: Consumer(builder: (context, ref, _) {
                      final ccc = ref.watch(countryContollerr);
                      return controllerCountry.when(
                          data: (data) {
                            return SingleChildScrollView(
                              physics: const AlwaysScrollableScrollPhysics(),
                              child: Column(
                                children: [
                                  ...reduceList().map((e) {
                                    return countryTile(
                                        country: e.name ?? '',
                                        capital: e.capital ?? '',
                                        function: () {
                                          ccc.setSelectedCountry(e);
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const CountryDetailsScreen()));
                                        },
                                        flag: e.flags?.svg);
                                  })
                                ],
                              ),
                            );
                          },
                          error: (error, _) {
                            return Center(
                              child: SingleChildScrollView(
                                physics: const AlwaysScrollableScrollPhysics(),
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  child: Center(
                                    child: Text(
                                      'Error generating countries\nPlease swipe down to refresh',
                                      style: TextStyle(
                                        fontFamily: 'Axiforma',
                                        fontSize: 16,
                                        color: colorTheme.surface,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          loading: () => Center(
                                child: SingleChildScrollView(
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: colorTheme.primary,
                                        backgroundColor: Colors.transparent,
                                        strokeWidth: 6,
                                      ),
                                    ),
                                  ),
                                ),
                              ));
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget countryTile(
      {required String country,
      required String capital,
      required VoidCallback function,
      String? flag}) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: function,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: SizedBox(
          width: size.width,
          child: Row(
            children: [
              flag != null || flag!.isNotEmpty
                  ? SizedBox(
                    height: 40,
                    width: 40,
                    child: SvgPicture.network(
                        flag,
                      ),
                  )
                  : Container(
                      width: 40,
                      height: 40,
                      color: colorTheme.secondary,
                    ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      country,
                      style: textTheme.labelLarge,
                    ),
                    Text(
                      capital,
                      style: textTheme.bodyMedium,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
