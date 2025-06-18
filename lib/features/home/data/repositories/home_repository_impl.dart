
import '../../domain/entities/restaurant_entity.dart';
import '../../domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<List<RestaurantEntity>> getNearbyRestaurants() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      RestaurantEntity(name: 'Allo Beirut', image: 'assets/images/res1.png', time: '32 mins'),
      RestaurantEntity(name: 'Laffah', image: 'assets/images/res2.png', time: '18 mins'),
      RestaurantEntity(name: 'Falaffi Al Rabbih', image: 'assets/images/res3.png', time: '45 mins'),
      RestaurantEntity(name: 'Barbar', image: 'assets/images/res4.png', time: '34 mins'),
    ];
  }
}
