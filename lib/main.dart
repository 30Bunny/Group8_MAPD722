import 'package:flutter/material.dart';
import 'package:group8_mapd722/app_config.dart';
import 'package:group8_mapd722/application.dart';
import 'package:group8_mapd722/environment.dart';
import 'package:group8_mapd722/provider/get_it_provider.dart';
import 'package:group8_mapd722/util/dialog_util.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DialogUtil.getInstance()?.configLoading();

  // load our config
  final config = await AppConfig.forEnvironment(Environment.prod);
  setupLocator(config);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Application();
  }
}
