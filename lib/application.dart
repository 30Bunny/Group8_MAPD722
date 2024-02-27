import 'package:flutter/material.dart';
import 'package:group8_mapd722/constant.dart';
import 'package:group8_mapd722/provider/globle_provider.dart';
import 'package:group8_mapd722/screen/home_screen.dart';
import 'package:group8_mapd722/theme/app_theme.dart';
import 'package:group8_mapd722/util/dialog_util.dart';
import 'package:provider/provider.dart';


class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider.value(
        value: GlobleProvider.instance,
        child: Consumer<GlobleProvider>(
          builder: (context, provider, child) {
            return MaterialApp(
              title: kAppName,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              builder: DialogUtil.getInstance()?.initLoader(),
              home: const HomeScreen(),
            );
          },
        ));
  }
}
