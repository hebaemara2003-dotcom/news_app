import 'package:flutter/material.dart';
import 'package:naws_app/home/category_details/category_details.dart';
import 'package:naws_app/home/category_fragment/category_fragment.dart';
import 'package:naws_app/utils/app_colors.dart';

import 'drawer/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home',
        style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      drawer:Drawer(
        backgroundColor: AppColors.blackColor,
        child: HomeDrawer(),
      ) ,
      body: CategoryFragment(),
    );
  }
}
