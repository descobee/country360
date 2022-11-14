import 'package:country360/domain/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CountryDetailsScreen extends ConsumerStatefulWidget {
  const CountryDetailsScreen({super.key});

  @override
  ConsumerState<CountryDetailsScreen> createState() =>
      _CountryDetailsScreenState();
}

class _CountryDetailsScreenState extends ConsumerState<CountryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final countryDetailProvider = ref.watch(countryContollerr).selectedCountry;
    final List images = [
      countryDetailProvider?.flags?.png,
      countryDetailProvider?.coatOfArms
    ];
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: CarouselSlider(
                          options: CarouselOptions(
                            viewportFraction: 0.9,
                            disableCenter: false,
                            autoPlay: true,
                            autoPlayAnimationDuration:
                                const Duration(seconds: 2),
                          ),
                          items: images
                              .map((item) => Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                        child: Image.network(item,
                                            fit: BoxFit.cover, width: 1000)),
                                  ))
                              .toList())),
                  // Align(
                  //   alignment: Alignment.center,
                  //   child: SizedBox(
                  //     height: 200,
                  //     child: Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 10),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Container(
                  //             padding: const EdgeInsets.all(5),
                  //             decoration: BoxDecoration(
                  //                 shape: BoxShape.circle,
                  //                 color: Colors.grey.withOpacity(0.6)),
                  //             child: const Icon(
                  //               Icons.keyboard_arrow_left,
                  //               color: Colors.black,
                  //               size: 40,
                  //             ),
                  //           ),
                  //           Padding(
                  //             padding: const EdgeInsets.only(right: 5),
                  //             child: Container(
                  //               padding: const EdgeInsets.all(5),
                  //               decoration: BoxDecoration(
                  //                   shape: BoxShape.circle,
                  //                   color: Colors.grey.withOpacity(0.6)),
                  //               child: const Icon(
                  //                 Icons.keyboard_arrow_right,
                  //                 color: Colors.black,
                  //                 size: 40,
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              headingAndDetails(
                  heading: 'Population:',
                  details:
                      countryDetailProvider?.population.toString() ?? "N/A"),
              headingAndDetails(
                  heading: 'Region:',
                  details: countryDetailProvider?.region ?? "N/A"),
              headingAndDetails(
                  heading: 'Capital :',
                  details: countryDetailProvider?.capital ?? "N/A"),
              headingAndDetails(
                  heading: "Language :",
                  details: countryDetailProvider?.languages?.values
                          .toString()
                          .replaceAll("{", "")
                          .replaceAll("}", "")
                          .replaceAll("(", "")
                          .replaceAll(")", "") ??
                      "N/A"),
              const SizedBox(
                height: 40,
              ),
              headingAndDetails(
                  heading: 'Independent :',
                  details: countryDetailProvider?.independent == true
                      ? "Yes"
                      : "No"),
              headingAndDetails(
                  heading: 'Area :',
                  details: countryDetailProvider?.area.toString() ?? "N/A"),
              headingAndDetails(
                  heading: 'Currency :',
                  details: countryDetailProvider?.currencies?.eur?.name ??
                      countryDetailProvider?.currencies?.usd?.name ??
                      countryDetailProvider?.currencies?.cad?.name ??
                      countryDetailProvider?.currencies?.gbp?.name ??
                      countryDetailProvider?.currencies?.ngn?.name ??
                      "N/A"),
              const SizedBox(
                height: 40,
              ),
              headingAndDetails(
                  heading: 'Timezone :',
                  details: countryDetailProvider?.timezones?.first ?? "N/A"),
              headingAndDetails(heading: 'Dialing Code :', details: "N/A"),
              headingAndDetails(
                  heading: 'Driving Side :',
                  details:
                      countryDetailProvider?.side.toString().toUpperCase() ??
                          "N/A"),
            ],
          ),
        ),
      ))),
    );
  }

  Widget headingAndDetails({String? heading, String? details}) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          if (heading == null)
            const SizedBox.shrink()
          else
            Text(
              heading,
              style: textTheme.headline1,
            ),
          if (heading == null)
            const SizedBox.shrink()
          else
            const SizedBox(width: 10),
          if (details == null)
            const SizedBox.shrink()
          else
            Expanded(
              child: Text(
                details,
                style: textTheme.subtitle1,
              ),
            ),
        ],
      ),
    );
  }
}
