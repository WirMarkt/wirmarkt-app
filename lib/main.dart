import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wir_markt/data/app_config.dart';
import 'package:wir_markt/generated/l10n.dart';
import 'package:wir_markt/home/home_page.dart';
import 'package:wir_markt/membership/membership_model.dart';
import 'package:wir_markt/utils.dart';
import 'package:wir_markt/wm_colors.dart';


void main({String? env = 'dev'}) async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // load our config
  final config = await AppConfig.forEnvironment(env: env);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MembershipModel()),
    ],
    child: MyApp(config),
  ));
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  final AppConfig config;

  const MyApp(this.config, {Key? key}) : super(key: key);

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
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('de', ''), // German, no country code
      ],
      theme: buildThemeData(Brightness.light),
      darkTheme: buildThemeData(Brightness.dark),
      home: const HomePage(),
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
