import 'package:dog_app/network/api_client.dart';
import 'package:dog_app/network/api_util.dart';
import 'package:dog_app/repositories/dog_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'configs/app_configs.dart';
import 'router/route_config.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  late ApiClient _apiClient;
  @override
  void initState() {
    _apiClient = ApiUtil.apiClient;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Setup PortraitUp only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<DogRepository>(create: (context) {
          return DogRepositoryImpl(apiClient: _apiClient);
        }),
      ],
      child: GetMaterialApp(
        title: AppConfigs.appName,
        initialRoute: RouteConfig.splash,
        getPages: RouteConfig.getPages,
      ),
    );
  }
}
