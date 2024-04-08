import 'package:ecommerce_c10_online/presentation/home/tabs/home_tab/home_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  HomeTab(),
    );
  }
}
