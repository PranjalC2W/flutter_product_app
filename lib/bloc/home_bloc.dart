import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_repository.dart';
import '../item_model.dart';

abstract class HomeEvent {}

class LoadDataEvent extends HomeEvent {}

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<ItemModel> items;

  HomeLoaded(this.items);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;

  HomeBloc({required HomeRepository repository})
      : repository = repository ,
        super(HomeInitial()) {
    on<LoadDataEvent>((event, emit) async {
      emit(HomeLoading());
      try {
        final items = await repository.fetchItems();
        print('Fetched items: $items');
        emit(HomeLoaded(items));
      } catch (e) {
        print('Error: $e');
        emit(HomeError('Failed to load items: $e'));
      }
    });
  }
}
