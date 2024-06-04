import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bloc_category_event.dart';
part 'bloc_category_state.dart';

class BlocCategoryBloc extends Bloc<BlocCategoryEvent, BlocCategoryState> {
  BlocCategoryBloc() : super(BlocCategoryInitial()) {
    on<BlocCategoryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
