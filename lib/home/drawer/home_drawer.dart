import 'package:flutter/material.dart';
import 'package:naws_app/home/drawer/divider_item.dart';
import 'package:naws_app/home/drawer/drawer_item.dart';
import 'package:naws_app/home/drawer/selected_item.dart';
import 'package:naws_app/utils/app_colors.dart';
import 'package:naws_app/utils/app_style.dart';
import 'package:naws_app/utils/media_query_extention.dart';

import '../../utils/app_assets.dart';

class HomeDrawer extends StatelessWidget {
  final VoidCallback onDrawerItemClick ;
  const HomeDrawer({super.key, required this.onDrawerItemClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.screenHeight*0.02,
      children: [
        Container(
          alignment: Alignment.center,
          height: context.screenHeight*0.20,
          color: AppColors.whiteColor,
          child: Text('News App',style: AppStyle.bold24black,),
        ),
        InkWell(
          onTap: (){
            // todo: calling
            onDrawerItemClick();
          },
          child: DrawerItem(iconName: AppAssets.homeIcon,
            text: 'Go To Home',),
        ),
        DividerItem(),
        DrawerItem(iconName: AppAssets.themeIcon,
          text: 'Theme',),
        SelectedItem(text: 'Dark', onPressed: () {
          //todo: show theme bottomSheet
        },),
        DividerItem(),
        DrawerItem(iconName: AppAssets.languageIcon,
          text: 'Language',),
        SelectedItem(text: 'Language', onPressed: () {
          //todo: show theme bottomSheet
        },),

      ],
    );
  }
}
