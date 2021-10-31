import 'package:blog/ui/theme/theme_bloc/theme_event.dart';
import 'package:blog/ui/theme/theme_bloc/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(initialState) : super(initialState);

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    yield ThemeState(themeData: event.theme);
  }
}
