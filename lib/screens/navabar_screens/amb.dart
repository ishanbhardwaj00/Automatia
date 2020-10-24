import 'package:flutter/material.dart';




class Amb extends StatefulWidget {
  @override
  _AmbState createState() => _AmbState();
}

class _AmbState extends State<Amb> {

  var isSwitched1= false;
  var isSwitched2= false;
  var isSwitched3= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text("Create Mood"),
        icon: Icon(Icons.add),
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
                  leading: Image(image: AssetImage("assets/sun.png"),),
                  title: Text("Morning", style: TextStyle(color:  Colors.black87),),
                  subtitle: Text("5 devices", style: TextStyle(color: Colors.black54),),
                  children: [
                    ListTile(
                      leading: AspectRatio(
                          aspectRatio: 0.5,
                          child: Image(image: AssetImage("assets/light1.png", ),)),
                      title: Text("Light 1"),
                      trailing: Icon(Icons.delete, color: Colors.red,),
                    ),ListTile(
                      leading: AspectRatio(
                          aspectRatio: 0.5,
                          child: Image(image: AssetImage("assets/light1.png", ),)),
                      title: Text("Light 1"),
                      trailing: Icon(Icons.delete, color: Colors.red,),
                    ),
                    ListTile(
                      leading: AspectRatio(
                          aspectRatio: 0.5,
                          child: Image(image: AssetImage("assets/light1.png", ),)),
                      title: Text("Light 1"),
                      trailing: Icon(Icons.delete, color: Colors.red,),
                    ),
                    ListTile(
                      leading: AspectRatio(
                          aspectRatio: 0.5,
                          child: Image(image: AssetImage("assets/light1.png", ),)),
                      title: Text("Light 1"),
                      trailing: Icon(Icons.delete, color: Colors.red,),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 0, right: 50),
                child: ExpansionTile(
                  trailing: Switch(
                    value: isSwitched2,
                    onChanged: (value){
                      setState(() {
                        isSwitched2=value;
                        print(isSwitched2);
                      });
                    },
                    activeTrackColor: Colors.deepPurpleAccent,
                    activeColor: Colors.deepPurple,
                  ),
                  expandedAlignment: Alignment.topLeft,
                  childrenPadding: EdgeInsets.only(left: 10),
                  leading: Image(image: AssetImage("assets/sun.png"),),
                  title: Text("Morning", style: TextStyle(color:  Colors.black87),),
                  subtitle: Text("5 devices", style: TextStyle(color: Colors.black54),),
                  children: [
                    ListTile(
                      leading: AspectRatio(
                          aspectRatio: 0.5,
                          child: Image(image: AssetImage("assets/light1.png", ),)),
                      title: Text("Light 1"),
                      trailing: Icon(Icons.delete, color: Colors.red,),
                    ),ListTile(
                      leading: AspectRatio(
                          aspectRatio: 0.5,
                          child: Image(image: AssetImage("assets/light1.png", ),)),
                      title: Text("Light 1"),
                      trailing: Icon(Icons.delete, color: Colors.red,),
                    ),
                    ListTile(
                      leading: AspectRatio(
                          aspectRatio: 0.5,
                          child: Image(image: AssetImage("assets/light1.png", ),)),
                      title: Text("Light 1"),
                      trailing: Icon(Icons.delete, color: Colors.red,),
                    ),
                    ListTile(
                      leading: AspectRatio(
                          aspectRatio: 0.5,
                          child: Image(image: AssetImage("assets/light1.png", ),)),
                      title: Text("Light 1"),
                      trailing: Icon(Icons.delete, color: Colors.red,),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 0, right: 50),
                child: ExpansionTile(
                  trailing: Switch(
                    value: isSwitched3,
                    onChanged: (value){
                      setState(() {
                        isSwitched3=value;
                        print(isSwitched3);
                      });
                    },
                    activeTrackColor: Colors.deepPurpleAccent,
                    activeColor: Colors.deepPurple,
                  ),
                  expandedAlignment: Alignment.topLeft,
                  childrenPadding: EdgeInsets.only(left: 10),
                  leading: Image(image: AssetImage("assets/sun.png"),),
                  title: Text("Morning", style: TextStyle(color:  Colors.black87),),
                  subtitle: Text("5 devices", style: TextStyle(color: Colors.black54),),
                  children: [
                    ListTile(
                      leading: AspectRatio(
                          aspectRatio: 0.5,
                          child: Image(image: AssetImage("assets/light1.png", ),)),
                      title: Text("Light 1"),
                      trailing: Icon(Icons.delete, color: Colors.red,),
                    ),ListTile(
                      leading: AspectRatio(
                          aspectRatio: 0.5,
                          child: Image(image: AssetImage("assets/light1.png", ),)),
                      title: Text("Light 1"),
                      trailing: Icon(Icons.delete, color: Colors.red,),
                    ),
                    ListTile(
                      leading: AspectRatio(
                          aspectRatio: 0.5,
                          child: Image(image: AssetImage("assets/light1.png", ),)),
                      title: Text("Light 1"),
                      trailing: Icon(Icons.delete, color: Colors.red,),
                    ),
                    ListTile(
                      leading: AspectRatio(
                          aspectRatio: 0.5,
                          child: Image(image: AssetImage("assets/light1.png", ),)),
                      title: Text("Light 1"),
                      trailing: Icon(Icons.delete, color: Colors.red,),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}