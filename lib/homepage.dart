import 'dart:math';

import 'package:automatia_second/models/user.dart';
import 'package:automatia_second/screens/navabar_screens/analytics.dart';
import 'package:automatia_second/screens/navabar_screens/home_screen.dart';
import 'package:automatia_second/screens/side_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'SizeConfig.dart';
import 'screens/timer.dart';
import 'screens/navabar_screens/voice_com.dart';
import 'screens/navabar_screens/amb.dart';
import 'screens/drawer.dart';

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
  PageController pageController= PageController(initialPage: 0);
  bool checkSearch=false;
  int _selectedIndex = 0;

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
                  pageController.jumpToPage(val);
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