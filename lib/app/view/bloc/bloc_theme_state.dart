part of 'bloc_theme.dart';

sealed class BlocThemeState extends Equatable {
  const BlocThemeState._({
    required this.theme,
    this.themeDark = false,
  });

  BlocThemeState.desde(
    BlocThemeState otro, {
    bool? themeDark,
    ThemeData? theme,
  }) : this._(
          themeDark: themeDark ?? otro.themeDark,
          theme: theme ?? otro.theme,
        );

  final ThemeData theme;

  final bool themeDark;

  @override
  List<Object> get props => [
        themeDark,
        theme,
      ];
}

class BlocThemeStateInitial extends BlocThemeState {
  const BlocThemeStateInitial(ThemeData theme) : super._(theme: theme);
}

class ThemeUpdatedState extends BlocThemeState {
  ThemeUpdatedState.desde(
    super.otro, {
    super.themeDark,
    super.theme,
  }) : super.desde();
}
