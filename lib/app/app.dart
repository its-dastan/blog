import 'package:blog/app/routes.dart';
import 'package:blog/bloc/auth_bloc/signin_bloc/signin_bloc.dart';
import 'package:blog/bloc/theme_bloc/theme_bloc.dart';
import 'package:blog/bloc/theme_bloc/theme_event.dart';
import 'package:blog/bloc/theme_bloc/theme_state.dart';
import 'package:blog/bloc/auth_bloc/auth_repositories.dart';
import 'package:blog/ui/screens/intro_screens/auth_screens/signin.dart';
import 'package:blog/ui/styles/app_theme.dart';
import 'package:blog/utils/constants.dart';
import 'package:blog/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<Widget> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox(authBox);

  return const MyApp();
}

class GlobalScrollBehaviour extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage(UiUtils.getImagePath("splash.png")), context);
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => AuthRepository(),
            child: const Signin(),
          ),
        ],
        child: Builder(builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<ThemeBloc>(
                create: (_) => ThemeBloc(
                    ThemeState(themeData: appThemeData[AppTheme.light])),
              ),
              BlocProvider<SigninBloc>(
                create: (_) =>
                    SigninBloc(authRepo: context.read<AuthRepository>()),
                child: const Signin(),
              ),
            ],
            child: Builder(
              builder: (context) {
                final currentTheme = context.watch<ThemeBloc>().state.themeData;
                return MaterialApp(
                  theme: currentTheme,
                  initialRoute: Routes.splash,
                  onGenerateRoute: Routes.onGenerateRouted,
                );
              },
            ),
          );
        }));
  }
}
