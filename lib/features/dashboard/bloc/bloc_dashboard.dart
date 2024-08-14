import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bloc_dashboard_event.dart';
part 'bloc_dashboard_state.dart';

/// TODO: add description
class BlocDashboard extends Bloc<BlocDashboardEvent, BlocDashboardState> {
  BlocDashboard() : super(const BlocDashboardStateInitial());
}
