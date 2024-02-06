part of 'bloc_home.dart';

@immutable

/// {@template BlocHomeState}
///
/// {@endtemplate}
sealed class BlocHomeState {
  /// {@macro BlocHomeEvent}
  const BlocHomeState._({
    this.plants = const [],
  });

  BlocHomeState.desde(
    BlocHomeState otro, {
    List<Plants>? plants,
  }) : this._(
          plants: plants ?? otro.plants,
        );

  final List<Plants> plants;

  List<Object> get props => [
        plants,
      ];
}

/// {@template BlocHomeInitial}
///
/// {@endtemplate}
final class BlocHomeStateInitial extends BlocHomeState {
  /// {@macro BlocHomeInitial}
  const BlocHomeStateInitial() : super._();
}

/// {@template BlocHomeStateLoading}
///
/// {@endtemplate}
class BlocHomeStateLoading extends BlocHomeState {
  /// {@macro BlocHomeStateLoading}
  BlocHomeStateLoading.desde(super.otro) : super.desde();
}

/// {@template BlocHomeStateSuccess}
///
/// {@endtemplate}
class BlocHomeStateSuccess extends BlocHomeState {
  /// {@macro BlocHomeStateSuccess}
  BlocHomeStateSuccess.desde(
    super.otro, {
    super.plants,
  }) : super.desde();
}

/// {@template BlocHomeStateFailed}
///
/// {@endtemplate}
class BlocHomeStateError extends BlocHomeState {
  /// {@macro BlocHomeStateFailed}
  BlocHomeStateError.desde(super.otro) : super.desde();
}
