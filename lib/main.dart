import 'package:country360/domain/controller.dart';
import 'package:country360/screens/country_screen.dart';
import 'package:country360/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ccc = ref.watch(countryContollerr);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      themeMode: ccc.themeMode,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
