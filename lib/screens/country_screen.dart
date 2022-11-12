import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            leading: Container(),
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
                  height: size.height * 0.5,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          width: size.width,
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: colorTheme.error,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Country Name',
                                    style: textTheme.headline1,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Capital',
                                    style: textTheme.subtitle1,
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
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
}
