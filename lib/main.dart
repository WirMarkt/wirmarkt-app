import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:wir_markt/analytics/analytics_model.dart';
import 'package:wir_markt/home/home_page.dart';
import 'package:wir_markt/membership/membership_model.dart';
import 'package:wir_markt/order/order_history_model.dart';
import 'package:wir_markt/utils.dart';
import 'package:wir_markt/wm_colors.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MembershipModel()),
      ChangeNotifierProvider(create: (context) => OrderHistoryModel()),
      ChangeNotifierProvider(create: (context) => AnalyticsModel()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => "WirMarkt",
      localizationsDelegates: const <LocalizationsDelegate>[
        AppLocalizations.delegate,
        // You need to add them if you are using the material library.
        // The material components uses this delegates to provide default
        // localization
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('de', ''), // German, no country code
      ],
      theme: ThemeData(
        bottomAppBarColor: WMColors.darkBlue,
        buttonTheme: ButtonThemeData(
          minWidth: 64,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: createMaterialColor(WMColors.darkBlue),
          brightness: Brightness.dark,
          accentColor: WMColors.orange,
          backgroundColor: WMColors.darkGrey,
        ),
      ),
      home: HomePage(),
      // routes: {
      //   '/home': (BuildContext context) => HomeScreen(),
      //   '/intro': (BuildContext context) => IntroScreen()
      // },
    );
  }
}
