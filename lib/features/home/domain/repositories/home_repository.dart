import '../entities/restaurant_entity.dart';

abstract class HomeRepository {
  Future<List<RestaurantEntity>> getNearbyRestaurants();
}