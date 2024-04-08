import 'package:ecommerce_c10_online/core/api/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/DI/di.dart';
import 'core/myobserver.dart';
import 'myapp.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  ApiManager.init();
  runApp(const MyApp());
}


