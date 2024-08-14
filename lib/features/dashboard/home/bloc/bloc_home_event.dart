part of 'bloc_home.dart';

/// {@template BlocHomeEvent}
/// TODO: add description
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

class BlocHomeEventCreatePlant extends BlocHomeEvent {
  const BlocHomeEventCreatePlant({
    required this.images,
    required this.newPlant,
  });

  final Plant newPlant;
  final List<File> images;
}
