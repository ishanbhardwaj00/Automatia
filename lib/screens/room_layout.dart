import 'package:automatia_second/models/room_data.dart';
import 'package:flutter/material.dart';

class RoomLayout extends StatefulWidget {
  Room room;
  RoomLayout({this.room});
  @override
  _RoomLayoutState createState() => _RoomLayoutState();
}

class _RoomLayoutState extends State<RoomLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Text(widget.room.roomName),
    );
  }
}
