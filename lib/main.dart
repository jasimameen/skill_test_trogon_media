import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_test_trogon_media/core/utils/navigation.dart';
import 'package:skill_test_trogon_media/features/feature1/presentation/pages/casts_page.dart';
import 'package:skill_test_trogon_media/features/feature1/presentation/pages/show_details_page.dart';
import 'features/feature1/presentation/bloc/bloc/shows_bloc.dart';

import 'features/feature1/presentation/pages/home_page.dart';
import 'injection.dart';

Future<void> main() async {
  await setupInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ShowsBloc>(),
      child: MaterialApp(
        navigatorKey: Navigation.initState(),
        title: 'Trogon Media Machine Test',
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (context) => const HomePage(),
          ShowDetailsPage.routeName: (context) => const ShowDetailsPage(),
          CastsPage.routeName:(context) => const CastsPage(),
        },
      ),
    );
  }
}
