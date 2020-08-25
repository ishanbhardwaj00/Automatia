import 'package:automatia_second/screens/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:automatia_second/models/setuo_model.dart';
import 'package:fluttertoast/fluttertoast.dart';


class DestinationScreen extends StatefulWidget {
  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}



class _DestinationScreenState extends State<DestinationScreen> {
  List<String> deviceName= ["Light", "Heavy", "Normal"];
  List<RoomSetup> setup= [];
  List<String> rooms= [];
  List<int> devices= [];
  String roomName= " ";
  int valm;
  String valn="Select Device";
  TextEditingController textEditingController= TextEditingController();
  List<int> tiles=[1,2,3,4,5,6,7,8];
  final formKey= GlobalKey<FormState>();
  void addRoom() {
    showModalBottomSheet(isScrollControlled: true,context: context, builder: (context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          height: 240,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                            width: 300,
                            child: Theme(
                                data: ThemeData(primaryColor: Colors.black),
                                child: TextFormField(
                                  textCapitalization: TextCapitalization.sentences ,
                                  validator: (value) {
                                    if(value.isEmpty)
                                      return "Enter room name!";
                                    else
                                      return null;
                                  },
                                  controller: textEditingController ,
                                  decoration: InputDecoration(fillColor: Colors.black87,labelText: "Room Name", labelStyle: TextStyle(fontWeight: FontWeight.w500,fontFamily: "Raleway", color: Color(0xff417F83))),))),
                      ),
                      Container(
                        width: 240,
                        child: DropdownButtonFormField(
                          validator: (drop) { return drop==null? "Choose no of devices" : null;
                          },
                          onChanged: (val) {
                            setState(() {
                              valm=val;
                            });
                          },
                          hint: Text("Select your devices"),
                          items: tiles.map((int val) {
                            return DropdownMenuItem(
                              value: val,
                              child: Text("$val devices"),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      RaisedButton(
                        elevation: 4,
                        color: Colors.white,
                        onPressed: () {
                          if(formKey.currentState.validate()) {
                            roomName=textEditingController.text;
                            rooms.add(roomName);
                            devices.add(valm);
                            textEditingController.clear();
                            Navigator.pop(context);
                          }
                        },
                        child: Text("Save"),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Set up your rooms", style: TextStyle(color: Colors.black87, fontSize: 24, fontWeight: FontWeight.bold ,fontFamily: "Raleway"),),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              onLongPress: () {
                Fluttertoast.showToast(
                    msg: "Add room",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    backgroundColor: Colors.black87
                );
              },
              child: GestureDetector(
                onTap: () => addRoom(),
                child: Icon(
                  Icons.add,
                  color: Colors.black87,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(itemCount: rooms.length,itemBuilder: (BuildContext context, int index) {
                    return Card(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: ExpansionTile(
                        title: Text(rooms[index] ?? "Room", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,fontFamily: "Raleway"),),
                        subtitle: Text("${devices[index]} devices" ?? "0", style: TextStyle( fontSize: 18,fontFamily: "Raleway", color: Colors.black54),),
                        children: [
                          Form(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: devices[index], itemBuilder: (BuildContext context, int val) {
                              return Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Container(
                                        width: 180,
                                        child: TextFormField(decoration: InputDecoration(
                                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                                            hintText: "Device ${val+1}"), style: TextStyle(fontFamily: "Raleway"),),),
                                  ),
                                  Container(
                                    width:100,
                                    child: DropdownButtonFormField(
                                      hint: Text("Type",style: TextStyle(color: Colors.black54, fontFamily: "Raleway")),
                                      onChanged: (val) {
                                        setState(() {
                                          valn=val;
                                        });
                                      },
                                      items: deviceName.map((val) {
                                        return DropdownMenuItem(
                                          child: Text(val, style: TextStyle(fontFamily: "Raleway"),),
                                          value: val,
                                        );
                                      }).toList() ,
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ),
                        ],
                      )
                    );
                  }),
                ),
              ],
            ),
            Positioned(
              bottom: 30,
              left: MediaQuery.of(context).size.width/2-120,
              child: Material(
                elevation: 4.0,
                shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black), borderRadius: BorderRadius.circular(30)),
                clipBehavior: Clip.hardEdge,
                child:InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                        return SignUp();
                      }));
                    },
                    child: Ink(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0,2),
                                  blurRadius: 4.0
                              ),
                            ],
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.black)
                        ),
                        width: 240,
                        height: 60,
                        child: Container(
                            alignment: Alignment.center,
                            child: Text("Let's Go", style: TextStyle(fontSize: 24, fontFamily: "Raleway", fontWeight: FontWeight.bold),)))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
