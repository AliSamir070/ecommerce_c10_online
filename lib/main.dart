import 'package:ecommerce_c10_online/core/api/api_manager.dart';
import 'package:ecommerce_c10_online/core/local/PrefsHelper.dart';
import 'package:ecommerce_c10_online/presentation/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/DI/di.dart';
import 'core/myobserver.dart';
import 'myapp.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  ApiManager.init();
  await PrefsHelper.init();
  runApp(BlocProvider(
      create: (BuildContext context) => HomeViewModel(),
      child: const MyApp()));
}


