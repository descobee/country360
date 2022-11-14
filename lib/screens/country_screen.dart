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
          .where(
              (e) => e.commonName!.toLowerCase().contains(query.toLowerCase()))
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
              return a.commonName!
                  .toLowerCase()
                  .compareTo(b.commonName!.toLowerCase());
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
          toolbarHeight: 30,
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
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: DecoratedBox(
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
            ),
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
                        hintStyle: textTheme.subtitle1,
                        focusedBorder: InputBorder.none),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: colorTheme.secondary),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/globe-913.svg',
                            color: colorTheme.primary,
                            height: 10,
                            width: 10,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text('EN'),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: colorTheme.secondary),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/filter-svgrepo-com.svg',
                            color: colorTheme.primary,
                            height: 10,
                            width: 10,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('Filter'),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: SizedBox(
                  child: RefreshIndicator(
                    onRefresh: () {
                      return ref.refresh(countryController.future);
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Consumer(builder: (context, ref, _) {
                        final ccc = ref.watch(countryContollerr);
                        return controllerCountry.when(
                            data: (data) {
                              return Column(
                                children: [
                                  ...reduceList().map((e) {
                                    return countryTile(
                                        country: e.commonName ?? 'N/A',
                                        capital: e.capital ?? 'N/A',
                                        function: () {
                                          ccc.setSelectedCountry(e);
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const CountryDetailsScreen()));
                                        },
                                        flag: e.flags?.png ?? '');
                                  })
                                ],
                              );
                            },
                            error: (error, _) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Center(
                                    child: Text(
                                      'Error generating countries\nPlease swipe down to refresh',
                                      style: TextStyle(
                                        fontFamily: 'Axiforma',
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              );
                            },
                            loading: () => const Center(
                                  child: CircularProgressIndicator(),
                                ));
                      }),
                    ),
                  ),
                )),
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
                  ? Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(image: NetworkImage(flag))),
                    )
                  : Container(
                      width: 40,
                      height: 40,
                      color: colorTheme.secondary,
                    ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    country,
                    style: textTheme.headline1,
                  ),
                  Text(
                    capital,
                    style: textTheme.subtitle1,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
