part of 'bloc_home.dart';

/// {@template BlocHomeState}
///
/// TODO: add description
/// {@endtemplate}
sealed class BlocHomeState {
  /// {@macro BlocHomeEvent}
  const BlocHomeState._({
    this.usuario,
    this.plants = const [],
  });

  BlocHomeState.from(
    BlocHomeState otro, {
    User? usuario,
    List<Plant>? plants,
  }) : this._(
          usuario: usuario ?? otro.usuario,
          plants: plants ?? otro.plants,
        );

  final List<Plant> plants;

  final User? usuario;

  List<Object> get props => [
        plants,
      ];
}

/// {@template BlocHomeInitial}
///
/// {@endtemplate}
final class BlocHomeStateInitial extends BlocHomeState {
  /// {@macro BlocHomeInitial}
  const BlocHomeStateInitial(User? usuario) : super._(usuario: usuario);
}

/// {@template BlocHomeStateLoading}
///
/// {@endtemplate}
class BlocHomeStateLoading extends BlocHomeState {
  /// {@macro BlocHomeStateLoading}
  BlocHomeStateLoading.from(super.otro) : super.from();
}

/// {@template BlocHomeStateCreatingPlant}
///
/// {@endtemplate}
class BlocHomeStateCreatingPlant extends BlocHomeState {
  /// {@macro BlocHomeStateCreatingPlant}
  BlocHomeStateCreatingPlant.from(super.otro) : super.from();
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

/// {@template BlocDashboardStateSuccessToCreatePlant}
///
/// {@endtemplate}
class BlocHomeStateSuccessToCreatePlant extends BlocHomeState {
  /// {@macro BlocDashboardStateSuccessToCreatePlant}
  BlocHomeStateSuccessToCreatePlant.from(
    super.state, {
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
