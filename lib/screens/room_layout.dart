import 'package:automatia_second/models/room_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';

class RoomLayout extends StatefulWidget {
  Room room;
  RoomLayout({this.room});
  @override
  _RoomLayoutState createState() => _RoomLayoutState();
}

class _RoomLayoutState extends State<RoomLayout> {
  int index=0;
  double sValue=20;
  toggleButton() {
    setState(() {
      isSwitched = !isSwitched;
    });
  }
  GlobalKey key= GlobalKey();
  bool isSwitched=false;
  int ind=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(

          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff191970 ), Color(0xff800080)],
            )),
            child: FlexibleSpaceBar(
              title: Text(widget.room.roomName, style: TextStyle(fontSize: 22),),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 12, top: 15, bottom: 15, right: 0),
            child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: FaIcon(FontAwesomeIcons.chevronLeft, size: 22,)),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Devices", style: TextStyle(fontSize: 24),),
          ),
          Container(height: 140,
            child: ListView.builder(shrinkWrap: true,scrollDirection: Axis.horizontal,itemBuilder: (BuildContext context, int val) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            ind=val;
                            index=val;
                          });
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width:  index==val? 85:80,
                              height: index==val? 85:80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    offset: Offset(0,2),
                                    color: Colors.grey
                                  ),
                                ]
                              ),
                            ),
                            Image(
                                image: AssetImage(widget.room.device[val].imageUrl),
                                height: 50,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(widget.room.device[val].deviceName),
                    ],
                  ),
                ),
              );
            }, itemCount: widget.room.devices,),
    ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.room.device[ind].deviceName, style: TextStyle(fontSize: 20),),
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow:
                      [
                        BoxShadow(
                          offset: Offset(0,2),
                          color: Colors.grey,
                        ),
                      ]
                  ),
                  child: AnimatedContainer(
                    padding: EdgeInsets.symmetric(vertical: 2,horizontal: 2.5),
                    duration: Duration(milliseconds: 400),
                    height: 30,
                    width: 95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: isSwitched? Colors.greenAccent.withOpacity(0.5): Colors.redAccent[100].withOpacity(0.5),

                    ),
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.ease,
                          top: 3,
                          left: isSwitched? 60: 0,
                          right: isSwitched? 0:60,
                          child: InkWell(
                            onTap: toggleButton,
                            child: AnimatedSwitcher(
                              duration: Duration(milliseconds: 400),
                              transitionBuilder: (Widget child, Animation<double> animation) {
                                return RotationTransition(
                                  child: child,
                                  turns: animation,
                                );
                              },
                              child: isSwitched? Text("ON", style: TextStyle(color: Colors.green),) :Text("OFF", style: TextStyle(color: Colors.red),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(height: 200,),
              Image(image: AssetImage(widget.room.device[ind].imageUrl), height: 200,),
            ],
          ),
          SizedBox(
            height: 10,
            
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("Intensity ", style: TextStyle(fontSize: 16),),
              ),
              Expanded(
                child: Slider(min: 0,
                  max: 100,
                  divisions: 5,
                  activeColor: Colors.deepPurple,
                  inactiveColor: Colors.black12,
                  label: ((sValue/20).toInt()).toString(),
                  value: sValue,
                  autofocus: true,
                  onChanged: (double newValue) {
    setState(() {
    sValue = newValue;
    });
    },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             InkWell(
               borderRadius: BorderRadius.circular(20),
                onTap: () {},
               child: Container(
                 alignment: Alignment.center,
                 decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black)
                 ),
                 height: 40,
                 width: 100,
                 child: Text("Save", style: TextStyle(fontSize: 20),),
               ),
             )
            ],
          ),
        ],
      ),
    );
  }
}
