import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:medusa_js_admin/blocs/auth/auth_bloc.dart';
import 'package:medusa_js_admin/blocs/sources/sources_bloc.dart';
import 'package:medusa_js_admin/blocs/theme/theme_bloc.dart';
import 'package:medusa_js_admin/routes/app_router.dart';
import 'package:medusa_js_dart/medusa_js_dart.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

final locator = GetIt.instance;

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  setupLocator();

  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('en'),
      Locale('it'),
    ],
    path: 'assets/translations',
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const FlexScheme usedScheme = FlexScheme.mandyRed;

    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => ThemeBloc(),
        ),
        BlocProvider<SourcesBloc>(
          create: (BuildContext context) => SourcesBloc(),
        ),
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(),
        )
      ],
      child: Builder(builder: (BuildContext context) {
        final themeState = context.watch<ThemeBloc>().state;
        final authState = context.watch<AuthBloc>().state;

        return MaterialApp.router(
          title: 'Medusa',
          scaffoldMessengerKey: snackbarKey,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          themeMode: themeState.themeMode,
          theme: FlexThemeData.light(
            scheme: usedScheme,
            // Opt in/out of using Material 3.
            useMaterial3: true,
            // We use the nicer Material 3 Typography in both M2 and M3 mode.
            typography:
                Typography.material2021(platform: defaultTargetPlatform),
          ),
          // Same definition for the dark theme, but using FlexThemeData.dark().
          darkTheme: FlexThemeData.dark(
            scheme: usedScheme,
            // Opt in/out of using Material 3.
            useMaterial3: true,
            // We use the nicer Material 3 Typography in both M2 and M3 mode.
            typography:
                Typography.material2021(platform: defaultTargetPlatform),
          ),
          routerConfig: _appRouter.config(
            deepLinkBuilder: (deepLink) => DeepLink([
              if (authState.source != null) AuthenticationRoute(),
              if (authState.source == null) SourcesRoute(),
            ]),
          ),
        );
      }),
    );
  }
}

void setupLocator() {
  locator.allowReassignment = true;

  locator.registerLazySingleton<Medusa>(
    () => Medusa(
      Configuration(
          baseUrl: 'http://localhost:9000',
          maxRetries: 3,
          debug: true,
          authenticationType: AuthenticationType.cookie,
          cookieToken:
              "s%3AYz--Q-OEh00Duuu_EcHRSG1oEyr1B1Ub.1yRP6BrldOjhySyClHV%2FEgEUI%2Fk7IzF7d3wUzk%2B2dbs"),
    ),
  );
}
