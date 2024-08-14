import 'dart:io';

import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/models/models.dart';
import 'package:app_plantas/repository/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bloc_home_event.dart';
part 'bloc_home_state.dart';

/// TODO: add description
class BlocHome extends Bloc<BlocHomeEvent, BlocHomeState> {
  BlocHome({User? usuario}) : super(BlocHomeStateInitial(usuario)) {
    on<BlocHomeEventInitial>(_onGetPlants);
    on<BlocHomeEventCreatePlant>(_onCreatePlant);
  }

  final _repoPlants = RepositoryPlants();
  final _sharedPreferencesHelper = SharedPreferencesHelper();

  Future<void> _onGetPlants(
    BlocHomeEventInitial event,
    Emitter<BlocHomeState> emit,
  ) async {
    emit(BlocHomeStateLoading.from(state));
    try {
      if (state.usuario != null) {
        await _sharedPreferencesHelper.saveUser(state.usuario!);
      }

      final plants = await _repoPlants.getPlants();

      emit(BlocHomeStateSuccess.from(state, plants: plants.reversed.toList()));
    } catch (e) {
      emit(BlocHomeStateError.from(state));
    }
  }

  Future<void> _onCreatePlant(
    BlocHomeEventCreatePlant event,
    Emitter<BlocHomeState> emit,
  ) async {
    emit(BlocHomeStateCreatingPlant.from(state));
    try {
      final usuario = await _sharedPreferencesHelper.getUser();

      final newPlants = await _repoPlants.createPlant(
        event.newPlant,
        event.images,
        usuario?.id ?? '',
      );

      final listPlants = [newPlants, ...state.plants];
      emit(
        BlocHomeStateSuccessToCreatePlant.from(
          state,
          plants: listPlants,
        ),
      );
    } catch (e) {
      emit(BlocHomeStateError.from(state));
    }
  }
}
