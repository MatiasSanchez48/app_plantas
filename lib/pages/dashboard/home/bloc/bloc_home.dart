import 'package:app_plantas/models/models.dart';
import 'package:app_plantas/repository/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'bloc_home_event.dart';
part 'bloc_home_state.dart';

class BlocHome extends Bloc<BlocHomeEvent, BlocHomeState> {
  BlocHome() : super(const BlocHomeStateInitial()) {
    on<BlocHomeEventInitial>(_onGetPlants);
  }

  final repositoryPlants = RepositoryPlants();

  Future<void> _onGetPlants(
    BlocHomeEventInitial event,
    Emitter<BlocHomeState> emit,
  ) async {
    emit(BlocHomeStateLoading.desde(state));
    try {
      // final plants = await repositoryPlants.getPlant(
      //   id: '6442e7a0248ff626993c10a4',
      // );

      // print(plants);

      emit(BlocHomeStateSuccess.desde(state, plants: []));
    } catch (e) {
      emit(BlocHomeStateError.desde(state));
    }
  }
}
