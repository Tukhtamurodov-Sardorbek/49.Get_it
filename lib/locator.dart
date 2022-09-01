import 'package:dependency_injection_get_it/domain/domain_controller.dart';
import 'package:dependency_injection_get_it/repository/meme_repo.dart';
import 'package:get_it/get_it.dart';

// * Create a get_it locator
final locator = GetIt.instance;

// * Create a setup method and create services
void setup(){
  // * LazySingleton will be removed whenever it's not necessary anymore and also be only loaded whenever it's necessary
  // * We want to have inside of our registerLazySingleton our repository and our controller, so that we can access them
  /// get_it identifies its services by type
  locator.registerLazySingleton<MemeRepository>(() => MemeRepository());
  locator.registerLazySingleton<MemeDomainController>(() => MemeDomainController());
}
