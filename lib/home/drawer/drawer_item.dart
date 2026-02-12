import 'package:flutter/material.dart';
import 'package:naws_app/utils/app_assets.dart';
import 'package:naws_app/utils/app_colors.dart';
import 'package:naws_app/utils/app_style.dart';
import 'package:naws_app/utils/media_query_extention.dart';

class DrawerItem extends StatelessWidget {
  final String iconName;
  final String text;

  const DrawerItem({super.key,required this.iconName,
  required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth*0.02
      ),
      child: Row(
        spacing: context.screenWidth*0.02,
        children: [
          Image.asset(iconName),
          Text(text,style: AppStyle.bold20White,),


        ],
      ),
    );
  }
}
