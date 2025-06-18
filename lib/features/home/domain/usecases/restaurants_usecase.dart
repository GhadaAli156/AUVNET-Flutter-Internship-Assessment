import '../entities/restaurant_entity.dart';
import '../repositories/home_repository.dart';

class GetRestaurantsUseCase {
  final HomeRepository repository;

  GetRestaurantsUseCase(this.repository);

  Future<List<RestaurantEntity>> call() => repository.getNearbyRestaurants();
}