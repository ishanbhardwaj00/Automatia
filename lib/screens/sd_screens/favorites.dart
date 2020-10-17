import 'package:automatia_second/models/ambience_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Fav extends StatefulWidget {
  @override
  _FavState createState() => _FavState();
  final List<AmbienceModel> ambienceModel;

  Fav({this.ambienceModel});
}

class _FavState extends State<Fav> {
  final stateKey= GlobalKey();
  bool isSwitched = false;
  bool isValue0() {
    if(widget.ambienceModel.length==0)
      return true;
    return false;
  } 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: stateKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff191970), Color(0xff800080)],
            )),
            child: FlexibleSpaceBar(
              title: Text(
                "Favorites",
                style: TextStyle(fontSize: 22),
              ),
            ),
          ),
          leading: Padding(
            padding:
                const EdgeInsets.only(left: 12, top: 15, bottom: 15, right: 0),
            child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: FaIcon(
                  FontAwesomeIcons.chevronLeft,
                  size: 22,
                )),
          ),
        ),
      ),
      body: isValue0()? Center(child: Text("Oops, you don't have any favorites", style: TextStyle(color: Colors.black54),)): Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Devices", style: TextStyle(fontSize: 22),),
          ),
          Divider(height: 1,),
          Expanded(
            child: ListView.builder(shrinkWrap: true,itemCount: widget.ambienceModel.length,itemBuilder: ((BuildContext context, int val) {
              var ambienceModel = widget.ambienceModel;
              return Card(color: Colors.white, margin: EdgeInsets.all(10),
                  child: ExpansionTile(
                    initiallyExpanded: false,
                    title: Text(ambienceModel[val].deviceName),
                    subtitle: Text(ambienceModel[val].roomName, style: TextStyle(color: Colors.black54),),
                    leading: Image(
                      image: AssetImage(ambienceModel[val].deviceImageURL)
              ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal :10.0,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Switch(
                              value: isSwitched,
                              onChanged: (value){
                                setState(() {
                                  isSwitched=value;
                                  print(isSwitched);
                                });
                              },
                              activeTrackColor: Colors.purpleAccent,
                              activeColor: Colors.deepPurple,
                            ),
                            Row(
                              children: [
                                Icon(Icons.delete, color: Colors.red),
                                SizedBox(width: 10,),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        ambienceModel.removeAt(val);
                                      });
                                    },
                                    child: Text("Delete from favorites", style: TextStyle(color: Colors.black54),)),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
              );
            })),
          )
        ],
      ),
    );
  }
}
