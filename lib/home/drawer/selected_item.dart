import 'package:flutter/material.dart';
import 'package:naws_app/utils/app_colors.dart';
import 'package:naws_app/utils/app_style.dart';
import 'package:naws_app/utils/media_query_extention.dart';

class SelectedItem extends StatelessWidget {
  String text;
  VoidCallback onPressed;
   SelectedItem({super.key,required this.text,
   required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.screenWidth*0.04
      ),
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth*0.03,
        vertical: context.screenHeight*0.01
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.transparentColor,
        border: Border.all(
          color: AppColors.whiteColor,
          width: 2
        )
      ),
      child: Row(
        children: [
          Text(text,style: AppStyle.medium20White,),
          Spacer(),
          IconButton(
            icon:Icon(Icons.arrow_drop_down_sharp,
              size: 35,color: AppColors.whiteColor,),
          onPressed:onPressed
          )
        ],
      ),
    );
  }
}
