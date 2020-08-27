import 'package:automatia_second/models/room_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../room_layout.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  FocusNode focusNode= FocusNode();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(height: 45, color: Theme.of(context).scaffoldBackgroundColor,),
            Container(height: 20, /*color: Color(0xff734f96),*/ decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,
                colors: [Color(0xff191970 ), Color(0xff800080)],
              ),
            ),),
            Positioned(
              top: 3,
              child: Container(width: 350, height:40, decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        offset: Offset(0,4),
                        color: Colors.black26
                    ),
                  ]
              ),
                alignment: Alignment.center,
                child: Container(width: 300,
                    alignment: Alignment.center,
                    child: TextFormField(
                      focusNode: focusNode,
                      onTap: () {
                        },
                      decoration: InputDecoration(
                          hintText: "Search for anything",
                          hintStyle: TextStyle(fontFamily: "Raleway"),
                          prefixIcon: focusNode.hasFocus? Icon(Icons.search, color:Colors.purple) :
                          Icon(Icons.search, color: Colors.grey,),
                          border: InputBorder.none),)),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 5, top:8),
          child: Text("Frequently used", style: TextStyle(fontSize: 22, fontFamily: "Raleway"),),
        ),
        Container(
          height: 100,
          child: ListView.builder(scrollDirection: Axis.horizontal,itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                return RoomLayout(room: rooms[index]);
              })),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Colors.grey,
                                offset: Offset(0,2),
                              ),
                            ]
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(rooms[index].roomName, style: TextStyle(fontFamily: "Raleway"),),
                      ],
                    ),
                    Positioned(
                      top: 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(
                          image:  AssetImage(rooms[index].imageUrl),
                          width: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }, itemCount: rooms.length-4,),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Divider(
            thickness: 0.3,
            color: Colors.black54,
            height: 5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text("Rooms", style: TextStyle(fontFamily: "Raleway", fontSize: 18, ),),
        ),
        Expanded(
          child: GridView.builder(shrinkWrap: true,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 240/210), itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal:10.0),
              child: Container(
                //color: Colors.green,
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                        return RoomLayout(room: rooms[index]);
                      })),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            height: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: rooms[index].color,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2,
                                  offset: Offset(0,1),
                                  color: Colors.black26
                                ),
                              ]
                            ),
                          ),
                          Positioned(
                              top: 5,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image(image:  AssetImage(rooms[index].imageUrl,), alignment: Alignment.center, width: 90, height: 90,))),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(rooms[index].roomName, style: TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.bold, fontSize: 14), ),
                        Text("${rooms[index].devices} devices", style: TextStyle(color: Colors.grey, fontSize: 16, fontFamily: "Raleway"),),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }, itemCount: rooms.length,),
        )
      ],
    );
  }
}