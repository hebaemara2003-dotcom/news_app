import 'package:flutter/material.dart';
import 'package:naws_app/home/category_fragment/category_item.dart';
import 'package:naws_app/model/category.dart';
import 'package:naws_app/utils/app_style.dart';
import 'package:naws_app/utils/media_query_extention.dart';
typedef OnCategoryItemClick = void Function(Category);
class CategoryFragment extends StatelessWidget {
  List <Category> categoriesList = [];
  OnCategoryItemClick onCategoryItemClick ;
   CategoryFragment({super.key, required this.onCategoryItemClick});

  @override
  Widget build(BuildContext context) {
    categoriesList = Category.getCategoriesList(true);
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth*0.04
        ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: context.screenHeight*0.02,
          children: [
            Text('Good Morning\nHere is Some News For You',
            style: AppStyle.medium24White,),
            ListView.separated(
              shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      // todo: calling
                      onCategoryItemClick(categoriesList[index]);
                    },
                    child: CategoryItem(category: categoriesList[index],
                      index: index,),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: context.screenHeight*0.02,);
                },
                itemCount: categoriesList.length),
        
          ],
        ),
      ),
    );
  }
}
