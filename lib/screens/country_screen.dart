import 'package:country360/country_model/country_model.dart';
import 'package:country360/domain/controller.dart';
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
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    final controllerCountry = ref.read(countryController);
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            leadingWidth: 500,
            leading: Row(
              children: [
                Text(
                  'Explore',
                  style: GoogleFonts.elsieSwashCaps(
                      fontSize: 20,
                      color: colorTheme.surface,
                      fontWeight: FontWeight.bold),
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
            actions: [Container()],
          ),
          body: Padding(
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
                  child: TextField(
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
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Consumer(builder: (context, ref, _) {
                      return controllerCountry.when(
                          data: (data) {
                            List<CountriesModel> countries = data
                                .map(
                                  (e) => e,
                                )
                                .toList();
                            return Column(
                              children: [
                                ...List.generate(countries.length, (index) {
                                  return countryTile(
                                      flag: countries[index].flags?.svg,
                                      country:
                                          countries[index].name?.common ?? '',
                                      capital:
                                          countries[index].capital?[0] ?? '');
                                })
                              ],
                            );
                          },
                          error: (error, _) {
                            return const Center(
                              child: Text(
                                'Error generating countries\nSwipe down to refresh',
                                style: TextStyle(
                                  fontFamily: 'Axiforma',
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            );
                          },
                          loading: () => const Center(
                                child: CircularProgressIndicator(),
                              ));
                    }),
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
      {required String country, required String capital, String? flag}) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        width: size.width,
        child: Row(
          children: [
            flag != null
                ? SvgPicture.network(flag, height: 40, width: 40)
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
                const SizedBox(
                  height: 5,
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
    );
  }
}
