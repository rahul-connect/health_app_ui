import 'package:flutter/material.dart';
import 'package:health_app_ui/constants.dart';
import 'package:health_app_ui/models/doctor.dart';
import 'package:health_app_ui/widgets/rating_icon.dart';


class DoctorDetail extends StatelessWidget {
  final Doctor doctor;
  DoctorDetail({this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Column(
          children: <Widget>[
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(doctor.image),fit: BoxFit.contain)
              ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 30,
                  left: 20,
                  child: GestureDetector(
                    onTap: ()=>Navigator.pop(context),
                    child: Container(
                      width: 50.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: kGrey2Color,
                      ),
                      child: Icon(Icons.arrow_back,color: Colors.white,),
                    ),
                  )
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25.0)),
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text.rich(TextSpan(
                        children: [
                          TextSpan(text: "${doctor.name}\n",style: kTitleStyle),
                          TextSpan(text: "${doctor.specialist}\n",style: kSubtitleStyle),
                        ]
                      )),

                       Spacer(),
                  ButtonAction(
                    color: kYellowColor,
                    icon: Icons.mail,
                  ),
                  SizedBox(width: 14,),
                   ButtonAction(
                    color: kGreen2Color,
                    icon: Icons.phone,
                  ),
                    ],
                  ),
                  SizedBox( height: 15.0,),

                  Row(
                    children: <Widget>[
                      RatingIcon(),
                      SizedBox(width: 12.0,),
                      Text("(${doctor.review}) reviews",style: kRatingStyle,),
                      Spacer(),
                       Text("See all reviews",style: kSubtitleStyle.copyWith(color:kBlue1Color),),
                    ],
                  ),

                  SizedBox(height: 20.0,),

                  Divider(color: kGreen2Color,),

                  SizedBox( height: 20.0,),

                  Text("About",style:kTitleStyle),
                  SizedBox(height: 20.0,),
                  Text(doctor.about,style: kSubtitleStyle,),
                   SizedBox(height: 20.0,),
                  Text("Working hours",style: kTitleStyle,),
                   SizedBox(height: 10.0,),

                  Row(
                    children: <Widget>[
                      Text(doctor.workingHours,style: kSubtitleStyle,),
                      SizedBox(width: 20.0,),
                      SizedBox(
                        width: 70.0,
                        height: 35.0,
                        child: RaisedButton(onPressed: (){},
                          color: kGreenColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0)
                          ),
                          child: Text("Open",style: kButtonStyle.copyWith(color:kGreen2Color),),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.0,),
                  Text("Stats",style: kTitleStyle,),
                  SizedBox(height: 20.0,),
                  Padding(padding:EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: <Widget>[
                      Stats(name: "Patients",total: doctor.patients,),
                      Spacer(),
                      StatsExperience(name: "Experience",total: doctor.experience,),
                      Spacer(),
                      Stats(name: "Certifications",total: doctor.certifications,),
                    ],

                  ),
                   ),
                 
                ],
              ),
            ),
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: SizedBox(
                height: 55,
                width: double.infinity,
                child: RaisedButton(onPressed: (){},
                elevation: 0.0,
                color: kBlue1Color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(25)
                ),
                child: Center(
                  child: Text("Make an appointment",style: kButtonStyle.copyWith(fontSize: 20),),
                ),
                
                ),
              ),
            ),
            SizedBox(height: 30.0,)
          ],
        )
      ),
      
    );
  }
}


class StatsExperience extends StatelessWidget {
  final String total;
  final String name;
  StatsExperience({this.name,this.total});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "$total ",style: kTitleStyle
          ),
          TextSpan(
            text: "years\n",style: kSubtitleStyle.copyWith(fontSize: 14)
          ),
           TextSpan(
            text: "$name\n",style: kSubtitleStyle.copyWith(fontSize: 14)
          ),
        ]
      ),
    );
  }
}



class Stats extends StatelessWidget {
  final String total;
  final String name;
  Stats({this.name,this.total});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "$total\n",style: kTitleStyle
          ),
          TextSpan(
            text: "$name\n",style: kSubtitleStyle.copyWith(fontSize: 14)
          ),
        ]
      ),
    );
  }
}


class ButtonAction extends StatelessWidget {
  final Color color;
  final IconData icon;
  ButtonAction({this.color,this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        color: color,
      ),
      child: Icon(icon,size: 25.0,color: Colors.white,),
      
    );
  }
}