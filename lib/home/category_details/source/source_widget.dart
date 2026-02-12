import 'package:flutter/material.dart';
import 'package:naws_app/home/category_details/source/source_tab.dart';
import 'package:naws_app/home/news/news_widget.dart';
import 'package:naws_app/model/sourse_response.dart';

import '../../../utils/app_colors.dart';

class SourceWidget extends StatefulWidget {
  final List<Source> sourceList ;

   SourceWidget({super.key,required this.sourceList});

  @override
  State<SourceWidget> createState() => _SourceWidgetState();
}

class _SourceWidgetState extends State<SourceWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
        length: widget.sourceList.length,
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
                onTap: (index){
                selectedIndex = index;
                setState(() {

                });

                },
                tabAlignment: TabAlignment.start,
                indicatorColor: Theme.of(context).splashColor,
                dividerColor: AppColors.transparentColor,
                tabs: widget.sourceList.map((source){
              return SourceTab(
                  source: source,
                  isSelected: selectedIndex == widget.sourceList.indexOf(source)
              );
            }).toList()
                ),
            Expanded(
              child: NewsWidget(
                  source: widget.sourceList[selectedIndex], ),
            )
          ],
        )
    );
  }
}
