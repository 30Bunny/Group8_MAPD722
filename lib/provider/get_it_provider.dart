import 'package:get_it/get_it.dart';
import 'package:group8_mapd722/app_config.dart';

GetIt locator = GetIt.instance;

void setupLocator(AppConfig appConfig) {
  locator.registerSingleton(appConfig);
}