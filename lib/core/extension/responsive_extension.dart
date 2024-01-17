

import 'package:flutter/material.dart';

extension ContextEx on BuildContext{
  double  get screenHeight{
    return MediaQuery.of(this).size.height;
  }

  double  get screenWidth{
    return MediaQuery.of(this).size.width;
  }

  double get listItemHeight{
    return MediaQuery.of(this).size.height/2.9;
  }

  double get dividerHeight{
    return MediaQuery.of(this).size.height*0.01;
  }

  double get paddingFromTop{
    return MediaQuery.of(this).size.height*0.015;
  }
   
  bool  showButtonAtBottomOfTheScreen({required int listLength}){
    if (listLength * (listItemHeight + dividerHeight+paddingFromTop) >
        screenHeight ) {
      return true;
    } else {
      return false;
    }
  }
}

extension EmptyPadding on num{
Widget get vSpace=>SizedBox(height: this.toDouble(),);
Widget get hSpace=>SizedBox(width: this.toDouble(),);  

}