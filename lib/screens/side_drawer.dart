import 'package:automatia_second/models/room_data.dart';
import 'package:automatia_second/models/user.dart';
import 'package:automatia_second/screens/navabar_screens/analytics.dart';
import 'package:automatia_second/screens/sd_screens/analytics.dart';
import 'package:automatia_second/screens/sd_screens/favorites.dart';
import 'package:automatia_second/screens/sd_screens/set_timer.dart';
import 'package:automatia_second/screens/sd_screens/sync_devices.dart';
import 'package:automatia_second/screens/timer.dart';
import 'package:flutter/material.dart';

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}
PageController pageController=PageController();
class _SideDrawerState extends State<SideDrawer> {
  List<dynamic> cName= [Sync(),Analytics(),SetTimer(),Fav(),AnalyticsNew(),AnalyticsNew(),AnalyticsNew(),AnalyticsNew(),AnalyticsNew(),AnalyticsNew(),];
  List<String> sideDrawerItems= ["Sync Devices", "Analytics", "Set Timer", "Favorites", "Support", "Tips", "Blogs", "Notifications", "Settings", "Log Out"];
  int deviceCount() {
    int sum=0;
    for(int i=0;i<rooms.length;i++) {
      sum+=rooms[i].devices;
    }
    return sum;
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(radius: 35,backgroundColor: Colors.lightBlueAccent, backgroundImage: AssetImage("assets/trump.jpg"),),
                SizedBox(height: 10,),
                Text(user.name, style: TextStyle(fontSize: 24, color: Colors.white ),),
                SizedBox(height: 8,),
                Text("Total devices: " + deviceCount().toString(), style: TextStyle(color: Colors.white,),),
              ],
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,
                colors: [Color(0xff191970 ), Color(0xff800080)],
              ),

              borderRadius: BorderRadius.circular(0)
            ),
          ),
          ListView.builder(padding: EdgeInsets.all(0),shrinkWrap: true,itemCount: sideDrawerItems.length, itemBuilder: (BuildContext context, int val)  {
            return  InkWell(
              onTap: () {
                Navigator.pop(context);
                pageController.jumpToPage(1);
              },
                splashColor: Colors.purple[100],
                child: Container(padding: EdgeInsets.all(15),child: Text(sideDrawerItems[val], style: TextStyle(fontSize: 16, fontFamily: "Raleway", ),),),
              );
            },)
        ],
      ),
    );
  }
}
