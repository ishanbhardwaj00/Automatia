import 'package:flutter/material.dart';




class Timer extends StatefulWidget {
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  bool isSwitched1=true;
  bool isSwitched2=true;
  bool isSwitched3=true;
  bool tuVal=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(

        onPressed: () {}, child: Icon(Icons.add),
        backgroundColor: Color(0xff734f96),
        elevation: 2,
        hoverElevation: 3,
      ),
      body: ListView(
        children: [
          Container(
            height: 20,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff191970), Color(0xff800080)],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Your mood",style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 0, right: 50),
                child: ExpansionTile(
                  trailing: Switch(
                    value: isSwitched1,
                    onChanged: (value){
                      setState(() {
                        isSwitched1=value;
                        print(isSwitched1);
                      });
                    },
                    activeTrackColor: Colors.deepPurpleAccent,
                    activeColor: Colors.deepPurple,
                  ),
                  expandedAlignment: Alignment.topLeft,
                  childrenPadding: EdgeInsets.only(left: 10),
                  leading: AspectRatio(
                      aspectRatio: 0.5,
                      child: Image(image: AssetImage("assets/light1.png"),)),
                  title: Text("12:09 PM", style: TextStyle(color:  Colors.black87),),
                  subtitle: Text("Light 1, Bedroom", style: TextStyle(color: Colors.black54),),
                  children: [
                  ListTile(
                    title: Text("Repeat"),
                    trailing:   Checkbox(
                      activeColor: Colors.deepPurple,
                      value: tuVal,
                      onChanged: (bool value) {
                        setState(() {
                          tuVal = value;
                        });
                      },
                    ),
                  ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround
                        ,
                        children: [
                          Text("Start", style: TextStyle(color: Colors.deepPurple, fontSize: 16, fontWeight: FontWeight.w600),),
                          Text("End", style: TextStyle(color: Colors.deepPurple, fontSize: 16, fontWeight: FontWeight.w600),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}