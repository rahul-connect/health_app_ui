import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app_ui/constants.dart';
import 'package:health_app_ui/models/doctor.dart';
import 'package:health_app_ui/views/doctor_details.dart';
import 'package:health_app_ui/widgets/doctor_card.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 70.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 18.0,
                ),
                child: Row(
                  children: <Widget>[
                    Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: "Hello\n",
                          style: kTitleStyle.copyWith(
                            fontSize: 26.0,
                            color: kGrey2Color,
                          ),
                        ),
                        TextSpan(
                          text: "Rahul Agarwal",
                          style: kTitleStyle.copyWith(
                            fontSize: 26.0,
                          ),
                        ),
                      ]),
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: AssetImage('assets/user.png'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                height: 55.0,
                margin: EdgeInsets.symmetric(horizontal: 18),
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                decoration: BoxDecoration(
                  color: kGrey1Color,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search",
                        icon: Icon(
                          FontAwesomeIcons.search,
                          size: 20.0,
                          color: Colors.black54,
                        ),
                        border: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                width: double.infinity,
                height: 150.0,
                margin: EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kBlue2Color),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 15.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Do you have symptoms\n of Covid 19",
                              style: kTitleStyle,
                            ),
                            Spacer(),
                            RaisedButton(
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              color: kBlue1Color,
                              elevation: 2.0,
                              child: SizedBox(
                                height: 50.0,
                                width: 150.0,
                                child: Center(
                                  child: Text("Contact a doctor",
                                      style: kButtonStyle),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Image.asset(
                      "assets/doctor11.png",
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 18.0,
                ),
                child: Text(
                  "Categories",
                  style: kTitleStyle,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                height: 80.0,
                margin: EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  children: <Widget>[
                    CategoryItem(
                      title: "General\n practitioner",
                      color: kRedColor,
                      icon: FontAwesomeIcons.stethoscope,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    CategoryItem(
                      title: "Dentist\n",
                      color: kYellowColor,
                      icon: FontAwesomeIcons.tooth,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25.0,
              ),


              Container(
                     width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0)
                  ),
                  color: kGrey1Color,
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "Top doctors",
                          style: kTitleStyle,
                        ),
                        Spacer(),
                        Text(
                          "See all",
                          style: kSubtitleStyle,
                        )
                      ],
                    ),

                    ListView.builder(
                      itemCount:doctorList.length,
                      scrollDirection: Axis.vertical,
                       shrinkWrap: true,
                       physics: ScrollPhysics(),
                      itemBuilder:(context,index){
                        var doctor = doctorList[index];
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorDetail(doctor: doctor,)));
                          },
                          child: DoctorCard(doctor:doctor));

                      }
                      
                       ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;
  CategoryItem({this.color, this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: kGrey2Color, width: 1.0)),
        child: Row(
          children: <Widget>[
            Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: color,
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(title, style: kCategoryStyle),
          ],
        ),
      ),
    );
  }
}
