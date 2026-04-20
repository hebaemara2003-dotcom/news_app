import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:naws_app/api/api_constants.dart';
import 'package:naws_app/api/end_points.dart';
import 'package:naws_app/model/news_response.dart';

import '../model/sourse_response.dart';
/*
https://newsapi.org/v2/top-headlines/sources?apiKey=90a0f0216a894924bb71f18f83206eb6
*/
class ApiManager{
  static Future<SourseResponse> getSources(String categoryId)async{
    Uri url = Uri.https(ApiConstants.baseUrl,
    EndPoints.sourceApi,
        {
      'apiKey': ApiConstants.apiKey,
          'category' : categoryId
        });
    // SourseResponse.fromJson( jsonDecode(response.body));
    try{
      var response = await http.get(url);
      var responseBody = response.body ; ///String
      /// String => json
      var json = jsonDecode(responseBody);/// json
      /// json => object
      return SourseResponse.fromJson(json);
    }
    catch(e){
      rethrow;
    }

  }

  /*https://newsapi.org/v2/everything?q=bitcoin&apiKey=90a0f0216a894924bb71f18f83206eb6

   */
   static Future<NewsResponse>  getNewsBySourceId(String sourceId)async{
     Uri url = Uri.https(
       ApiConstants.baseUrl,
       EndPoints.newsApi,
         {
         'apiKey': ApiConstants.apiKey,
         'sources': sourceId
     }
     );
    try{
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    }catch(e){
      rethrow;
    }


   }

}