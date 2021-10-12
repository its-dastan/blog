import 'package:blog/app/routes.dart';
import 'package:blog/bloc/theme_bloc/theme_bloc.dart';
import 'package:blog/bloc/theme_bloc/theme_event.dart';
import 'package:blog/bloc/theme_bloc/theme_state.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (_) =>
              ThemeBloc(ThemeState(themeData: appThemeData[AppTheme.light])),
        )
      ],
      child: Builder(
        builder: (context) {
          final currentTheme = context.watch<ThemeBloc>().state.themeData;
          return MaterialApp(
            theme: currentTheme,
            home: Scaffold(
              body: Center(
                child: TextButton(
                  onPressed: () {
                    if (currentTheme?.brightness == Brightness.light) {
                      BlocProvider.of<ThemeBloc>(context)
                          .add(ThemeEvent(theme: appThemeData[AppTheme.dark]));
                    } else {
                      BlocProvider.of<ThemeBloc>(context).add(ThemeEvent(
                        theme: appThemeData[AppTheme.light],
                      ));
                    }
                  },
                  child: const Text("hello"),
                ),
              ),
            ),
            initialRoute: Routes.splash,
            onGenerateRoute: Routes.onGenerateRouted,
          );
        },
      ),
    );
  }
}
