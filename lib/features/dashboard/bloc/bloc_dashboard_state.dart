part of 'bloc_dashboard.dart';

/// TODO: add description
class BlocDashboardState extends Equatable {
  const BlocDashboardState._();

  const BlocDashboardState.from(
    BlocDashboardState state,
  ) : this._();

  @override
  List<Object> get props => [];
}

class BlocDashboardStateInitial extends BlocDashboardState {
  const BlocDashboardStateInitial() : super._();
}

/// {@template BlocHomeStateLoading}
///
/// {@endtemplate}
class BlocDashboardStateLoading extends BlocDashboardState {
  /// {@macro BlocHomeStateLoading}
  const BlocDashboardStateLoading.from(super.state) : super.from();
}

/// {@template BlocDashboardStateSuccess}
///
/// {@endtemplate}
class BlocDashboardStateSuccess extends BlocDashboardState {
  /// {@macro BlocDashboardStateSuccess}
  const BlocDashboardStateSuccess.from(super.state) : super.from();
}

/// {@template BlocDashboardStateError}
///
/// {@endtemplate}
class BlocDashboardStateError extends BlocDashboardState {
  /// {@macro BlocDashboardStateError}
  const BlocDashboardStateError.from(super.state) : super.from();
}
