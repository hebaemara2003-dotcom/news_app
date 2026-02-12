import 'package:flutter/material.dart';
import 'package:naws_app/utils/app_colors.dart';
import 'package:naws_app/utils/app_style.dart';

class AppTheme{
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.whiteColor,
    splashColor: AppColors.blackColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme:AppBarTheme(
        backgroundColor: AppColors.whiteColor,
    iconTheme: IconThemeData(color: AppColors.blackColor))  ,
    textTheme: TextTheme(
      labelLarge: AppStyle.bold16black,
      labelSmall: AppStyle.medium12Gray,
      labelMedium: AppStyle.medium14black,
      headlineMedium: AppStyle.medium24black,
      headlineLarge: AppStyle.medium20black
    )

  );
  static final ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.blackColor,
      splashColor: AppColors.whiteColor,
      scaffoldBackgroundColor: AppColors.blackColor,
      appBarTheme:AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.blackColor,
          iconTheme: IconThemeData(color: AppColors.whiteColor))  ,
      textTheme: TextTheme(
          labelLarge: AppStyle.bold16White,
          labelSmall: AppStyle.medium12Gray,
          labelMedium: AppStyle.medium14White,
          headlineMedium: AppStyle.medium24White,
          headlineLarge: AppStyle.medium20White
      )

  );
}