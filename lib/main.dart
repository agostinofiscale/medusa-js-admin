import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medusa_js_admin/cubits/ThemeCubit.dart';
import 'package:medusa_js_admin/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

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
    return BlocProvider<ThemeCubit>(
      create:(context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeModeState>(
        builder: (BuildContext context, ThemeModeState state) => MaterialApp.router(
          title: 'Medusa',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          themeMode: state.themeMode,
          darkTheme: ThemeData.dark(),
          routerConfig: _appRouter.config(
            deepLinkBuilder: (deepLink) => const DeepLink([
              HomeRoute(),
            ]),
          ),
        ),
      ),
    );
  }
}
