import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/doctor.dart';
import 'rating_icon.dart';


class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  DoctorCard({this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22)
      ),
      child: Container(
        padding: EdgeInsets.all(12.0),
        width: double.infinity,
        height: 100.0,
        child: Row(
          children: <Widget>[
            Container(
              width: 80.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.0),
                color: kBlue2Color,
                image: DecorationImage(image: AssetImage(doctor.image),fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 8.0,),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(doctor.name,style: kTitleStyle,overflow: TextOverflow.ellipsis,),
                    SizedBox(height: 6.0,),
                    Text(doctor.specialist,style: kCategoryStyle.copyWith(color:kGrey2Color),overflow: TextOverflow.ellipsis,),
                    Spacer(),
                    Row(
                      children: <Widget>[
                        RatingIcon(),
                        Spacer(),
                        Text("(${doctor.review})",style: kRatingStyle,)
                      ],
                    )
                  ],
                ),
              ),
              ),
              SizedBox(width: 8.0,),
              Container(
                width: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 1.0,
                          color: kGrey1Color,
                        ),
                      ),
                      child: Center(
                        child: Icon(Icons.bookmark_border),
                      ),

                    )),

                    SizedBox(height: 10,),

                    Expanded(
                      flex: 1,
                      child: RaisedButton(onPressed: (){},
                      color: kGreenColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      child: Text("Book",style: kButtonStyle.copyWith(color: kGreen2Color),),

                      )),
                  ],

                ),
              ),
          ],
        ),
      ),
    );
  }
}