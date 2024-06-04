part of 'bloc_category_bloc.dart';

sealed class BlocCategoryState extends Equatable {
  const BlocCategoryState();
  
  @override
  List<Object> get props => [];
}

final class BlocCategoryInitial extends BlocCategoryState {}
