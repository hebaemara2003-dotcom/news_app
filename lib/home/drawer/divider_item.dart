import 'package:flutter/material.dart';
import 'package:naws_app/utils/media_query_extention.dart';

import '../../utils/app_colors.dart';

class DividerItem extends StatelessWidget {
  const DividerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Divider(
      color: AppColors.whiteColor,
      thickness: 2,
      indent:context.screenWidth*0.06,
      endIndent: context.screenWidth*0.06,
    );
  }
}
