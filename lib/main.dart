import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wir_markt/training/repository/training_repository.dart';

import 'api/api.dart';
import 'authentication/authentication.dart';
import 'data/app_config.dart';
import 'generated/l10n.dart';
import 'home/view/home_page.dart';
import 'impact_info/repository/impact_content_repository.dart';
import 'login/login.dart';
import 'member_contribution/repository/member_contribution_repository.dart';
import 'member_info/repository/member_info_repository.dart';
import 'splash/splash.dart';
import 'wm_design.dart';

void main({String? env = 'prod'}) async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // load our config
  await AppConfig.initFromEnvironment(env: env);

  var _apiRepository = ApiRepository(AppConfig.get().apiUrl);
  var _contentApiRepository = ApiRepository(AppConfig.get().contentApiUrl);

  runApp(App(
    authenticationRepository: AuthenticationRepository(_apiRepository),
    memberInfoRepository: MemberInfoRepository(_apiRepository),
    memberContributionRepository: MemberContributionRepository(_apiRepository),
    impactContentRepository: ImpactContentRepository(_contentApiRepository),
    trainingRepository: TrainingRepository(_contentApiRepository),
  ));
}

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.authenticationRepository,
    required this.memberInfoRepository,
    required this.memberContributionRepository,
    required this.impactContentRepository,
    required this.trainingRepository,
  }) : super(key: key);
  final AuthenticationRepository authenticationRepository;

  final MemberInfoRepository memberInfoRepository;
  final MemberContributionRepository memberContributionRepository;
  final ImpactContentRepository impactContentRepository;
  final TrainingRepository trainingRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: authenticationRepository),
        RepositoryProvider.value(value: impactContentRepository),
        RepositoryProvider.value(value: memberInfoRepository),
        RepositoryProvider.value(value: memberContributionRepository),
        RepositoryProvider.value(value: trainingRepository),
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
        textTheme: GoogleFonts.interTextTheme(
          ThemeData(brightness: brightness).textTheme,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: WMDesign.turquoise,
          brightness: brightness,
        ),
      );
}
