import 'dart:math';
import 'package:automatia_second/models/user.dart';
import 'package:automatia_second/screens/navabar_screens/analytics.dart';
import 'package:automatia_second/screens/navabar_screens/home_screen.dart';
import 'package:automatia_second/screens/sd_screens/blogs.dart';
import 'package:automatia_second/screens/sd_screens/favorites.dart';
import 'package:automatia_second/screens/sd_screens/notifications.dart';
import 'package:automatia_second/screens/sd_screens/settings.dart';
import 'package:automatia_second/screens/sd_screens/support.dart';
import 'package:automatia_second/screens/sd_screens/sync_devices.dart';
import 'package:automatia_second/screens/sd_screens/tips.dart';
import 'package:automatia_second/screens/side_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'SizeConfig.dart';
import 'models/room_data.dart';
import 'screens/timer.dart';
import 'screens/navabar_screens/voice_com.dart';
import 'screens/navabar_screens/amb.dart';
import 'screens/drawer.dart';

PageController pageController= PageController(initialPage: 0);
int _selectedIndex = 0;
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with SingleTickerProviderStateMixin{

  unFocusKeyboard() {
    FocusScope.of(context).unfocus();
    setState(() {
      checkSearch= false;
    });
  }
  bool checkSearch=false;


  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: unFocusKeyboard,
          child: Scaffold(
            drawer: SideDrawer(),
            appBar: PreferredSize(
                child: AppBar(
                  //backgroundColor: Color(0xff734f96),
                  elevation: 0.0,
                  iconTheme: new IconThemeData(color: Colors.white),
                  flexibleSpace:
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,
                        colors: [Color(0xff191970 ), Color(0xff800080)],
                      ),
                    ),
                    child: FlexibleSpaceBar(
                      titlePadding: EdgeInsets.all(0),
                      centerTitle: true,
                      title: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12, right: 9),
                            child: Text("Good Morning,", style: TextStyle( fontSize: 24, fontWeight: FontWeight.w300),),
                          ),
                          Text(user.name, style: TextStyle(fontSize: 25),)
                        ],
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                preferredSize: Size.fromHeight(110)),
            body: Column(
              children: [
                Expanded(child: PageView(
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (a) {
                    setState(() {
                      _selectedIndex= a;
                    });
                  },
                  controller: pageController,
                  pageSnapping: true,
                  children: [
                    HomeScreen(),
                    Analytics(),
                    VoiceCom(),
                    Timer(),
                    Amb(),
                  ],
                )),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedIconTheme: IconThemeData(color: Color(0xff734f96), size: 30),
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              onTap: (val) {
                setState(() {
                  _selectedIndex=val;
                  pageController.jumpToPage(_selectedIndex);
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text("Home", style: TextStyle(fontFamily: "Raleway", color: _selectedIndex==0? Color(0xff734f96): Colors.grey),),
                ),BottomNavigationBarItem(
                  icon: Icon(Icons.equalizer),
                  title: Text("Analytics",style: TextStyle(fontFamily: "Raleway",color: _selectedIndex==1? Color(0xff734f96): Colors.grey),),
                ),BottomNavigationBarItem(
                  icon: Icon(Icons.graphic_eq),
                  title: Text("Voice Com",style: TextStyle(fontFamily: "Raleway",color: _selectedIndex==2? Color(0xff734f96): Colors.grey),),
                ),BottomNavigationBarItem(
                  icon: _selectedIndex==3? Icon(Icons.hourglass_full) : Icon(Icons.hourglass_empty),
                  title: Text("Timer",style: TextStyle(fontFamily: "Raleway",color: _selectedIndex==3? Color(0xff734f96): Colors.grey),),
                ),BottomNavigationBarItem(
                  icon: _selectedIndex==4? Icon(Icons.favorite, color: Colors.red,): Icon(Icons.favorite_border) ,
                  title: Text("Ambience",style: TextStyle(fontFamily: "Raleway",color: _selectedIndex==4? Colors.red : Colors.grey),),
                ),
              ],
            ),
          ),
        );
      },

    );
  }
}

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}
class _SideDrawerState extends State<SideDrawer> {
  //List<dynamic> cName= [Sync(),Analytics(),SetTimer(),Fav(),AnalyticsNew(),AnalyticsNew(),AnalyticsNew(),AnalyticsNew(),AnalyticsNew(),AnalyticsNew(),];
  //List<String> sideDrawerItems= ["Sync Devices", "Analytics", "Set Timer","Favorites", "Support", "Tips", "Blogs", "Notifications", "Settings", "Log Out"];
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
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context ) {
                return Sync();
              }));
              },
            splashColor: Colors.purple[100],
            child: Container(padding: EdgeInsets.all(15),child: Text("Sync Devices", style: TextStyle(fontSize: 16, fontFamily: "Raleway", ),),),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _selectedIndex=1;
                pageController.jumpToPage(_selectedIndex);
              });
            },
            splashColor: Colors.purple[100],
            child: Container(padding: EdgeInsets.all(15),child: Text("Analytics", style: TextStyle(fontSize: 16, fontFamily: "Raleway", ),),),
          ),InkWell(
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _selectedIndex=2;
                pageController.jumpToPage(_selectedIndex);
              });
            },
            splashColor: Colors.purple[100],
            child: Container(padding: EdgeInsets.all(15),child: Text("Set Timer", style: TextStyle(fontSize: 16, fontFamily: "Raleway", ),),),
          ),InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context ) {
                return Fav();
              }));
            },
            splashColor: Colors.purple[100],
            child: Container(padding: EdgeInsets.all(15),child: Text("Favorites", style: TextStyle(fontSize: 16, fontFamily: "Raleway", ),),),
          ),InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context ) {
                return Support();
              }));
            },
            splashColor: Colors.purple[100],
            child: Container(padding: EdgeInsets.all(15),child: Text("Support", style: TextStyle(fontSize: 16, fontFamily: "Raleway", ),),),
          ),InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context ) {
                return Tips();
              }));
            },
            splashColor: Colors.purple[100],
            child: Container(padding: EdgeInsets.all(15),child: Text("Tips", style: TextStyle(fontSize: 16, fontFamily: "Raleway", ),),),
          ),InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context ) {
                return Blogs();
              }));
            },
            splashColor: Colors.purple[100],
            child: Container(padding: EdgeInsets.all(15),child: Text("Blogs", style: TextStyle(fontSize: 16, fontFamily: "Raleway", ),),),
          ),InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context ) {
                return Notifications();
              }));
            },
            splashColor: Colors.purple[100],
            child: Container(padding: EdgeInsets.all(15),child: Text("Notifications", style: TextStyle(fontSize: 16, fontFamily: "Raleway", ),),),
          ),InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context ) {
                return Settings();
              }));
            },
            splashColor: Colors.purple[100],
            child: Container(padding: EdgeInsets.all(15),child: Text("Settings", style: TextStyle(fontSize: 16, fontFamily: "Raleway", ),),),
          ), InkWell(
            onTap: () {

            },
            splashColor: Colors.purple[100],
            child: Container(padding: EdgeInsets.all(15),child: Text("Logout", style: TextStyle(fontSize: 16, fontFamily: "Raleway", ),),),
          )
        ],
      ),
    );
  }
}
