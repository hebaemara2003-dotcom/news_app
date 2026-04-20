import 'package:flutter/material.dart';
import 'package:naws_app/utils/app_colors.dart';
import 'package:naws_app/utils/media_query_extention.dart';
import 'package:naws_app/utils/app_style.dart';

typedef OnChanged = void Function(String)?;
class TextFieldSearch extends StatefulWidget {
  final VoidCallback? onClose ;
  Widget? prefixIcon;
  Widget? suffixIcon;
  OnChanged onChanged;
  String? hintText;
  TextStyle? hintStyle;
  Color? fillColor;
  bool ?filled;
   TextFieldSearch({super.key,
    this.prefixIcon, this.suffixIcon,
   this.onChanged,this.fillColor,this.hintText,
   this.hintStyle, this.filled,this.onClose});

  @override
  State<TextFieldSearch> createState() => _TextFieldSearchState();
}

class _TextFieldSearchState extends State<TextFieldSearch> {

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: (){
        // todo: searching

      },
      style: TextStyle(color: Theme.of(context).splashColor,),
      decoration: InputDecoration(
        enabled: true,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
            color: Theme.of(context).splashColor
          )
        ),
        focusColor: Theme.of(context).splashColor,
        hintText: 'Search',
        hintStyle:
        AppStyle.medium20White,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Theme.of(context).splashColor,
            
          )
        ),
        filled: true,
        fillColor: AppColors.transparentColor,
        prefixIcon: Icon(Icons.search_outlined,color:
          Theme.of(context).splashColor,),
        suffixIcon: IconButton(
            onPressed: widget.onClose
          , icon: Icon(Icons.close_outlined,
          color: Theme.of(context).splashColor,),
        ),


        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 5,
        color: Theme.of(context).splashColor))
      ),

    );
  }
}
