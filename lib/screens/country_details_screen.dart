import 'package:country360/domain/controller.dart';
import 'package:flutter/material.dart' hide CarouselController;
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
      countryDetailProvider?.flags?.png
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
                                const Duration(seconds: 1),
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
                  details: countryDetailProvider?.languages
                          ?.map((lang) => lang.name)
                          .toList()
                          .toString()
                          .replaceAll("{", "")
                          .replaceAll("}", "")
                          .replaceAll("[", "")
                          .replaceAll("]", "") ??
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
                  details:
                      countryDetailProvider?.currencies?.first.name ?? "N/A"),
              const SizedBox(
                height: 40,
              ),
              headingAndDetails(
                  heading: 'Timezone :',
                  details: countryDetailProvider?.timezones?.first ?? "N/A"),
              headingAndDetails(heading: 'Dialing Code :', details: "N/A"),
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
              style: textTheme.labelLarge,
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
                style: textTheme.bodyMedium,
              ),
            ),
        ],
      ),
    );
  }
}
