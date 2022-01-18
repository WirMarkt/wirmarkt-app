import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wir_markt/api/api.dart';
import 'package:wir_markt/authentication/authentication.dart';
import 'package:wir_markt/data/app_config.dart';
import 'package:wir_markt/generated/l10n.dart';
import 'package:wir_markt/home/home_page.dart';
import 'package:wir_markt/login/login.dart';
import 'package:wir_markt/member_info/repository/member_info_repository.dart';
import 'package:wir_markt/splash/splash.dart';
import 'package:wir_markt/utils.dart';
import 'package:wir_markt/wm_design.dart';

void main({String? env = 'prod'}) async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // load our config
  await AppConfig.initFromEnvironment(env: env);

  var _apiRepository = ApiRepository();

  runApp(App(
    authenticationRepository: AuthenticationRepository(_apiRepository),
    memberInfoRepository: MemberInfoRepository(_apiRepository),
  ));
}

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.authenticationRepository,
    required this.memberInfoRepository,
  }) : super(key: key);

  final AuthenticationRepository authenticationRepository;
  final MemberInfoRepository memberInfoRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: authenticationRepository),
        RepositoryProvider.value(value: memberInfoRepository),
      ],
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: authenticationRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      onGenerateTitle: (context) => AppConfig.get().orgName,
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
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listenWhen: (state, previousState) {
            return state.status != previousState.status;
          },
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  HomePage.route(),
                  (route) => false,
                );
                break;
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  LoginPage.route(),
                  (route) => false,
                );
                break;
              default:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }

  ThemeData buildThemeData(Brightness brightness) => ThemeData.from(
        textTheme: GoogleFonts.ibmPlexSansTextTheme(
          ThemeData(brightness: brightness).textTheme,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: createMaterialColor(WMDesign.turquoise),
          brightness: brightness,
          accentColor: WMDesign.lightGreen,
        ),
      );
}
