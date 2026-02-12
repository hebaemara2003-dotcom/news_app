// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:naws_app/model/category.dart';
import 'package:naws_app/utils/app_colors.dart';
import 'package:naws_app/utils/media_query_extention.dart';

class CategoryItem extends StatelessWidget {
  final Category category ;
  int index;
    CategoryItem({super.key,required this.category,
   required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: (index%2==0)?Alignment.bottomRight:
        Alignment.bottomLeft,
      children:[
    Container(
      clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(24),
    ),
    child: Image.asset(category.image)
    ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: context.screenWidth*0.04,
            vertical: context.screenHeight*0.02
          ),
          padding: EdgeInsetsDirectional.only(
            start: (index%2==0)?context.screenWidth*0.04:0,
            end:(index%2==0)?0:context.screenWidth*0.04 ,

          )
            ,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(84),
            color: AppColors.grayColor,
          ),
          child: Row(
            spacing: context.screenWidth*0.04,
            mainAxisSize: MainAxisSize.min,
            textDirection: (index%2==0)?TextDirection.ltr:
            TextDirection.rtl,
            children: [
              Text('View All',style: Theme.of(context).textTheme.headlineMedium,),
              CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                radius: 25,
                child: Icon ((index%2==0)?
                 Icons.arrow_forward_ios_outlined:
                 Icons.arrow_back_ios_outlined,
                color: Theme.of(context).splashColor

                ),
                  
              ),

            ],
          ),
        )
    
      ]
    );
  }
}
