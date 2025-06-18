import '../../domain/entities/restaurant_entity.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<RestaurantEntity> restaurants;

  HomeLoaded(this.restaurants);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
