import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'api/api.dart';
import 'authentication/authentication.dart';
import 'data/app_config.dart';
import 'generated/l10n.dart';
import 'home/view/home_page.dart';
import 'impact_item/repository/impact_item_repository.dart';
import 'login/login.dart';
import 'partner/repository/partner_repository.dart';
import 'recipe/repository/recipe_repository.dart';
import 'shifts_needing_help/repository/shifts_needing_help_repository.dart';
import 'splash/splash.dart';
import 'training/repository/training_repository.dart';
import 'upcoming_shift/repository/upcoming_shift_repository.dart';
import 'user/bloc/user_bloc.dart';
import 'user/repository/user_repository.dart';
import 'wm_design.dart';

void main({String? env = 'prod'}) async {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  GoogleFonts.config.allowRuntimeFetching = false;

  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // load our config
  await AppConfig.initFromEnvironment(env: env);

  runApp(App());
}

class App extends StatelessWidget {
  App({
    super.key,
  });

  late final _apiRepository = ApiRepository(AppConfig.get().apiUrl);
  late final _contentApiRepository =
      ApiRepository(AppConfig.get().contentApiUrl);
  late final _authenticationRepository =
      AuthenticationRepository(_apiRepository);
  late final _userRepository = UserRepository(_apiRepository);
  late final _upcomingShiftRepository = UpcomingShiftRepository(_apiRepository);
  late final _shiftsNeedingHelpRepository =
      ShiftsNeedingHelpRepository(_apiRepository);
  late final _impactContentRepository =
      ImpactItemRepository(_contentApiRepository);
  late final _partnerRepository = PartnerRepository(_contentApiRepository);
  late final _trainingRepository = TrainingRepository(_contentApiRepository);
  late final _recipeRepository = RecipeRepository(_contentApiRepository);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _authenticationRepository),
        RepositoryProvider.value(value: _impactContentRepository),
        RepositoryProvider.value(value: _userRepository),
        RepositoryProvider.value(value: _upcomingShiftRepository),
        RepositoryProvider.value(value: _shiftsNeedingHelpRepository),
        RepositoryProvider.value(value: _trainingRepository),
        RepositoryProvider.value(value: _recipeRepository),
        RepositoryProvider.value(value: _partnerRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (_) => AuthenticationBloc(
              authenticationRepository: _authenticationRepository,
            ),
          ),
          BlocProvider<UserBloc>(
            create: (_) => UserBloc(
              userRepository: _userRepository,
            ),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

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
      debugShowCheckedModeBanner: false,
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

  ThemeData buildThemeData(Brightness brightness) {
    var colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.turquoise,
      brightness: brightness,
    );
    var theme = ThemeData.from(
      useMaterial3: true,
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
        cardTheme: theme.cardTheme.copyWith(
          elevation: 1,
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          margin: EdgeInsets.all(0),
        ),
        bottomNavigationBarTheme: theme.bottomNavigationBarTheme.copyWith(
          elevation: 0,
          enableFeedback: false,
        ));
  }
}
