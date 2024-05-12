part of 'bloc_home.dart';

/// {@template BlocHomeState}
///
/// {@endtemplate}
sealed class BlocHomeState {
  /// {@macro BlocHomeEvent}
  const BlocHomeState._({
    this.plants = const [],
  });

  BlocHomeState.from(
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
  BlocHomeStateLoading.from(super.otro) : super.from();
}

/// {@template BlocHomeStateSuccess}
///
/// {@endtemplate}
class BlocHomeStateSuccess extends BlocHomeState {
  /// {@macro BlocHomeStateSuccess}
  BlocHomeStateSuccess.from(
    super.otro, {
    super.plants,
  }) : super.from();
}

/// {@template BlocHomeStateFailed}
///
/// {@endtemplate}
class BlocHomeStateError extends BlocHomeState {
  /// {@macro BlocHomeStateFailed}
  BlocHomeStateError.from(super.otro) : super.from();
}
