part of 'bloc_app.dart';

sealed class BlocAppEvent extends Equatable {
  const BlocAppEvent();

  @override
  List<Object> get props => [];
}

class BlocAppEventInitial extends BlocAppEvent {
  const BlocAppEventInitial();
}

class BlocAppEventToggleTheme extends BlocAppEvent {
  const BlocAppEventToggleTheme({
    this.themeDark = false,
  });

  final bool themeDark;
}
