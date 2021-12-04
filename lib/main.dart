
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:wir_markt/generated/l10n.dart';
import 'package:wir_markt/home/home_page.dart';
import 'package:wir_markt/membership/membership_model.dart';
import 'package:wir_markt/utils.dart';
import 'package:wir_markt/wm_colors.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MembershipModel()),
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
        S.delegate,
        // You need to add them if you are using the material library.
        // The material components uses this delegates to provide default
        // localization
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        //Locale('en', ''), // English, no country code
        Locale('de', ''), // German, no country code
      ],
      theme: buildThemeData(Brightness.light),
      darkTheme: buildThemeData(Brightness.dark),
      home: HomePage(),
      // routes: {
      //   '/home': (BuildContext context) => HomeScreen(),
      //   '/intro': (BuildContext context) => IntroScreen()
      // },
    );
  }

  ThemeData buildThemeData(Brightness brightness) => ThemeData.from(
        textTheme: GoogleFonts.ibmPlexSansTextTheme(
          ThemeData(brightness: brightness).textTheme,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: createMaterialColor(WMColors.darkBlue),
          brightness: brightness,
          accentColor: WMColors.orange,
        ),
      );
}
