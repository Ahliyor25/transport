import 'package:flutter/material.dart';
import 'package:transport/ui/theme/app_colors.dart';
import 'package:transport/ui/widgets/welcome/welcome_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transport Dushanbe',
      theme: ThemeData(
        fontFamily: 'SanFrancisco',
        appBarTheme: const AppBarTheme(
          // backgroundColor: AppColors.backColor,
          color: Colors.transparent,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainDarkBlue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
      home: const WelcomeWidget(),

      // routes: mainNavigation.routes,
      // initialRoute: MainNavigationRouteNames.loaderWidget,
      // onGenerateRoute: mainNavigation.onGenerateRoute,
    );
  }
}
