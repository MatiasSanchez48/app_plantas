part of 'bloc_theme.dart';

sealed class BlocThemeEvent extends Equatable {
  const BlocThemeEvent();

  @override
  List<Object> get props => [];
}

class BlocThemeEventInitial extends BlocThemeEvent {
  const BlocThemeEventInitial();
}

class BlocThemeEventToggleTheme extends BlocThemeEvent {
  const BlocThemeEventToggleTheme({
    this.themeDark = false,
  });

  final bool themeDark;
}
