import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:naws_app/utils/app_style.dart';
import 'package:naws_app/utils/media_query_extention.dart';

import '../../model/news_response.dart';

class NewsItem extends StatelessWidget {
  final News news;
  const NewsItem({super.key,required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.screenWidth*0.02,
        vertical: context.screenHeight*0.01,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth*0.02,
        vertical: context.screenHeight*0.01,

      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).splashColor,
          width: 2,
        )
      ),
      child: Column(
        spacing: context.screenHeight*0.02,
        children: [
          ClipRRect(
            child: CachedNetworkImage(
                imageUrl: news.urlToImage??'',
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),) ,
          ),
          Text(news.title??'',
          style: Theme.of(context).textTheme.labelMedium,),
          Row(
            children: [
              Expanded(
                child: Text('By:${news.author??''}',
                  style: AppStyle.medium12Gray,),
              ),
              Text(news.publishedAt??'',
              style: AppStyle.medium12Gray,),

            ],
          )
        ],
      ),

    );
  }
}
