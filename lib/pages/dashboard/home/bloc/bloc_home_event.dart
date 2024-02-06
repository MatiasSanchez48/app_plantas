part of 'bloc_home.dart';

@immutable

/// {@template BlocHomeEvent}
///
/// {@endtemplate}
abstract class BlocHomeEvent extends Equatable {
  /// {@macro BlocHomeEvent}
  const BlocHomeEvent();

  @override
  List<Object> get props => [];
}

class BlocHomeEventInitial extends BlocHomeEvent {
  const BlocHomeEventInitial();
}
