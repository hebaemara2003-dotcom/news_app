import 'package:flutter/material.dart';
import 'package:naws_app/api/api_manager.dart';
import 'package:naws_app/home/widget/main_error_widget.dart';
import 'package:naws_app/home/widget/main_loading_widget.dart';
import 'package:naws_app/model/news_response.dart';

import '../../model/sourse_response.dart';
import 'news_item.dart';

class NewsWidget extends StatefulWidget {
  final Source source;
   NewsWidget({super.key,required this.source,
  });

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNewsBySourceId(widget.source.id??''),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return MainLoadingWidget();
          }
          else if (snapshot.hasError){
            return MainErrorWidget(
                errorMessage: 'Somthing went wrong',
                onPressed: ()
                {
                  ApiManager.getNewsBySourceId(widget.source.id??'');
                  setState(() {

                  });
                }
            );
          }
          //todo: server => respons =>success
          if(snapshot.data?.status == 'error'){
            return MainErrorWidget(
                errorMessage: snapshot.data!.message!,
                onPressed: (){
                  ApiManager.getNewsBySourceId(widget.source.id??'');
                });
          }
          // todo: server => respons =>success
          var newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
              itemBuilder: (context, index) {
                return NewsItem(news : newsList[index]);
              },
          itemCount: newsList.length,
          );
        },);
  }
}
