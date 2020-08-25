import 'dart:core';

import 'package:flutter/material.dart';

class Room {
  int devices;
  String roomName;
  String imageUrl;
  Color color;
  Room({this.devices, this.imageUrl, this.roomName, this.color});

}


List<Room> rooms= [
  Room(roomName: "Bedroom", imageUrl: "assets/roomImages/bedroom.jpg", devices: 5, color: Color(0xffDBF0FF)),
  Room(roomName: "Bathroom", imageUrl: "assets/roomImages/bathroom.jpg", devices: 2, color: Color(0xffFBECDE)),
  Room(roomName: "Work Room", imageUrl: "assets/roomImages/desk.jpg", devices: 3, color: Color(0xffF8F8F8)),
  Room(roomName: "Store Room", imageUrl: "assets/roomImages/shelf.jpg", devices: 5,color: Color(0xffDBF0FF)),
  Room(roomName: "Living Room", imageUrl: "assets/roomImages/sofa.jpg", devices: 5,color: Color(0xffDBF0FF)),
  Room(roomName: "Bedroom", imageUrl: "assets/roomImages/bedroom.jpg", devices: 5,color: Color(0xffDBF0FF)),
  Room(roomName: "Bedroom", imageUrl: "assets/roomImages/bedroom.jpg", devices: 5, color: Color(0xffF8F8F8)),
  Room(roomName: "Bedroom", imageUrl: "assets/roomImages/bedroom.jpg", devices: 5, color: Color(0xffFBECDE)),
  Room(roomName: "Bedroom", imageUrl: "assets/roomImages/bedroom.jpg", devices: 5, color: Color(0xffFBECDE)),
];