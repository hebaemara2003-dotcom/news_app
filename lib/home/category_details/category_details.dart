import 'package:flutter/material.dart';
import 'package:naws_app/home/category_details/source/source_widget.dart';
import 'package:naws_app/home/widget/main_error_widget.dart';
import 'package:naws_app/home/widget/main_loading_widget.dart';
import 'package:naws_app/model/sourse_response.dart';
import 'package:naws_app/utils/app_colors.dart';
import 'package:naws_app/utils/app_style.dart';

import '../../api/api_manager.dart';

class CategoryDetails extends StatefulWidget {
  final String errorMessage ;
  final VoidCallback onPressed ;
  const CategoryDetails({super.key,
  required this.onPressed, required this.errorMessage});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourseResponse>(
      future: ApiManager.getSources(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // todo : loading
         return MainLoadingWidget();
        }
        else if (snapshot.hasError) {
          return MainErrorWidget(errorMessage: 'Something went Wrong'
              , onPressed: () {
            ApiManager.getSources();
            setState(() {

            });
            },);
        }
        // todo: server => response => success,error
        if (snapshot.data?.status != 'ok') {
          return MainErrorWidget(
            errorMessage: snapshot.data!.message!
            , onPressed: () {
              ApiManager.getSources();
              setState(() {

              });
            },
          );

        }
        //todo : respons => source
        var sourceList = snapshot.data?.sources ?? [];
        return SourceWidget(
            sourceList: sourceList);
      },
    );
  }
}
