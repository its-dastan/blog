import 'package:blog/ui/theme/app_theme.dart';
import 'package:blog/ui/theme/theme_bloc/theme_bloc.dart';
import 'package:blog/ui/theme/theme_bloc/theme_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final currentTheme = context.watch<ThemeBloc>().state.themeData;
        return Scaffold(
          body: Center(
            child: TextButton(
              onPressed: () {
                if (currentTheme?.brightness == Brightness.light) {
                  BlocProvider.of<ThemeBloc>(context)
                      .add(ThemeEvent(theme: appThemeData[AppTheme.dark]));
                } else {
                  BlocProvider.of<ThemeBloc>(context).add(
                    ThemeEvent(
                      theme: appThemeData[AppTheme.light],
                    ),
                  );
                }
              },
              child: const Text("hello"),
            ),
          ),
        );
      },
    );
  }
}
