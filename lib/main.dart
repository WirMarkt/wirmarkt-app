import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'api/api.dart';
import 'authentication/authentication.dart';
import 'data/app_config.dart';
import 'generated/l10n.dart';
import 'home/view/home_page.dart';
import 'impact_info/repository/impact_content_repository.dart';
import 'login/login.dart';
import 'member_contribution/repository/member_contribution_repository.dart';
import 'member_info/repository/member_info_repository.dart';
import 'recipe/repository/recipe_repository.dart';
import 'splash/splash.dart';
import 'training/repository/training_repository.dart';
import 'wm_design.dart';

void main({String? env = 'prod'}) async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // load our config
  await AppConfig.initFromEnvironment(env: env);

  runApp(App());
}

class App extends StatelessWidget {
  App({
    Key? key,
  }) : super(key: key);

  late final _apiRepository = ApiRepository(AppConfig
      .get()
      .apiUrl);
  late final _contentApiRepository =
  ApiRepository(AppConfig
      .get()
      .contentApiUrl);
  late final _authenticationRepository =
  AuthenticationRepository(_apiRepository);
  late final _memberInfoRepository = MemberInfoRepository(_apiRepository);
  late final _memberContributionRepository =
  MemberContributionRepository(_apiRepository);
  late final _impactContentRepository =
  ImpactContentRepository(_contentApiRepository);
  late final _trainingRepository = TrainingRepository(_contentApiRepository);
  late final _recipeRepository = RecipeRepository(_contentApiRepository);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _authenticationRepository),
        RepositoryProvider.value(value: _impactContentRepository),
        RepositoryProvider.value(value: _memberInfoRepository),
        RepositoryProvider.value(value: _memberContributionRepository),
        RepositoryProvider.value(value: _trainingRepository),
        RepositoryProvider.value(value: _recipeRepository),
      ],
      child: BlocProvider(
        create: (_) =>
            AuthenticationBloc(
              authenticationRepository: _authenticationRepository,
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
      onGenerateTitle: (context) =>
      AppConfig
          .get()
          .orgName,
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

  ThemeData buildThemeData(Brightness brightness) {
    var colorScheme = ColorScheme.fromSeed(
      seedColor: WMDesign.turquoise,
      brightness: brightness,
    );
    var theme = ThemeData.from(
      textTheme: GoogleFonts.interTextTheme(
        ThemeData(brightness: brightness).textTheme,
      ),
      colorScheme: colorScheme,
    );
    return theme.copyWith(
        appBarTheme: theme.appBarTheme.copyWith(
          backgroundColor: colorScheme.background,
          foregroundColor: colorScheme.primary,
          elevation: 0, // This removes the shadow from all App Bars.
        ),
        cardColor: theme.secondaryHeaderColor,
        cardTheme: theme.cardTheme.copyWith(
          color: theme.secondaryHeaderColor,
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        bottomNavigationBarTheme: theme.bottomNavigationBarTheme.copyWith(
          elevation: 0,
          enableFeedback: false,
        ));
  }
}
