import 'package:flutter/material.dart';
import 'package:health_app_ui/constants.dart';

class RatingIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.star,size: 15,color: kYellowColor,),
        Icon(Icons.star,size: 15,color: kYellowColor,),
        Icon(Icons.star,size: 15,color: kYellowColor,),
        Icon(Icons.star,size: 15,color: kGrey2Color,),
      ],
      
    );
  }
}