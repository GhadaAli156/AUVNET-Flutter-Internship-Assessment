import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/restaurants_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetRestaurantsUseCase getRestaurantsUseCase;

  HomeBloc(this.getRestaurantsUseCase) : super(HomeInitial()) {
    on<LoadRestaurants>((event, emit) async {
      emit(HomeLoading());
      try {
        final data = await getRestaurantsUseCase();
        emit(HomeLoaded(data));
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });
  }
}
