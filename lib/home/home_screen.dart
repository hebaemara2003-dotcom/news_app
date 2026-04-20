import 'package:flutter/material.dart';
import 'package:naws_app/home/category_details/category_details.dart';
import 'package:naws_app/home/category_fragment/category_fragment.dart';
import 'package:naws_app/home/search/text_field_search.dart';
import 'package:naws_app/model/category.dart';
import 'package:naws_app/utils/app_colors.dart';
import 'package:naws_app/utils/media_query_extention.dart';

import '../api/api_manager.dart';
import 'drawer/home_drawer.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    //   appBar: AppBar(
    //   centerTitle: true,
    //   title: Text(
    //     selectedCategory == null ?'Home':
    //     selectedCategory!.title,
    //     style: Theme.of(context).textTheme.headlineLarge,
    //   ),
    //   actions: [
    //     IconButton(
    //         onPressed: (){
    //           // todo : textFieldSearch
    //           setState(() {
    //             isSearching = true;
    //           });
    //         },
    //         icon: Icon(Icons.search_outlined, size: 30,))
    //   ],
    // ),
      appBar: AppBar(
        centerTitle: true,
        title: isSearching ? null :
        Text(
          selectedCategory == null? 'Home':
              selectedCategory!.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        flexibleSpace: isSearching ? SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.screenWidth*0.02
                ),
              child:TextFieldSearch(onClose: (){
                setState(() {
                  isSearching = false;
                });
              },),
            )
        ): null,
        actions: [
          if(!isSearching)
            IconButton(
                onPressed: (){
                  setState(() {
                    isSearching = true ;
                  });
                }, icon: Icon(Icons.search_outlined,size: 30,))
        ],
      ),
      drawer: isSearching? null :
      Drawer(
        backgroundColor: AppColors.blackColor,
        child: HomeDrawer(onDrawerItemClick: onDrawerItemClick,),
      ) ,
      body: selectedCategory == null ?
      CategoryFragment(onCategoryItemClick: onCategoryItemClick,):
          CategoryDetails(category: selectedCategory!,),
    );
  }

  Category? selectedCategory;

  void onCategoryItemClick(Category newSelectedCategory){
    //todo: newsSelectedCategory => user choose
    selectedCategory = newSelectedCategory ;
    setState(() {

    });
  }
  void onDrawerItemClick(){
   selectedCategory = null ;
   Navigator.pop(context);
   setState(() {

   });
  }
}
