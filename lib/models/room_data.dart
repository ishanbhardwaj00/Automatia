import 'dart:core';

import 'package:flutter/material.dart';

class Room {
  int devices;
  String roomName;
  String imageUrl;
  Color color;
  List<Devices> device;
  Room({this.devices, this.imageUrl, this.roomName, this.color, this.device});

}
class Devices {
  String deviceName;
  String imageUrl;
  Devices({this.imageUrl, this.deviceName});
}

List<Devices> bedroomDevices= [
  Devices(deviceName: "Light 1", imageUrl: "assets/light1.png"),
  Devices(deviceName: "Light 2", imageUrl: "assets/light2.png"),
  Devices(deviceName: "Light 3", imageUrl: "assets/light1.png"),
  Devices(deviceName: "Fan", imageUrl: "assets/fan.png"),
  Devices(deviceName: "AC", imageUrl: "assets/ac.png"),
];
List<Devices> bathroomDevices= [
  Devices(deviceName: "Light 1", imageUrl: "assets/light1.png"),
  Devices(deviceName: "Fan", imageUrl: "assets/fan.png"),
  Devices(deviceName: "Geyser", imageUrl: "assets/geyser.jpg"),
];
List<Devices> studyDevices= [
  Devices(deviceName: "Light 1", imageUrl: "assets/light1.png"),
  Devices(deviceName: "Fan", imageUrl: "assets/fan.png"),
  Devices(deviceName: "AC", imageUrl: "assets/ac.png"),
];
List<Devices> storeRoomDevices= [
  Devices(deviceName: "Light 1", imageUrl: "assets/light1.png"),
  Devices(deviceName: "Light 2", imageUrl: "assets/light2.png"),
];

List<Devices> livingRoomDevices= [
  Devices(deviceName: "Light 1", imageUrl: "assets/light1.png"),
  Devices(deviceName: "Light 2", imageUrl: "assets/light2.png"),
  Devices(deviceName: "Fan", imageUrl: "assets/fan.png"),
  Devices(deviceName: "Fan", imageUrl: "assets/fan.png"),
  Devices(deviceName: "AC", imageUrl: "assets/ac.png"),
];

List<Room> rooms= [
  Room(roomName: "Bedroom", imageUrl: "assets/roomImages/bedroom.jpg", devices: 5, color: Color(0xffDBF0FF),device: bedroomDevices),
  Room(roomName: "Bathroom", imageUrl: "assets/roomImages/bathroom.jpg", devices: 3, color: Color(0xffFBECDE), device: bathroomDevices),
  Room(roomName: "Study", imageUrl: "assets/roomImages/desk.jpg", devices: 3, color: Color(0xffF8F8F8),device: studyDevices),
  Room(roomName: "Store Room", imageUrl: "assets/roomImages/shelf.jpg", devices: 2,color: Color(0xffDBF0FF),device: storeRoomDevices),
  Room(roomName: "Living Room", imageUrl: "assets/roomImages/sofa.jpg", devices: 5,color: Color(0xffDBF0FF),device: livingRoomDevices),
  Room(roomName: "Bedroom", imageUrl: "assets/roomImages/bedroom.jpg", devices: 5,color: Color(0xffDBF0FF),device: bedroomDevices),
  Room(roomName: "Bedroom", imageUrl: "assets/roomImages/bedroom.jpg", devices: 5, color: Color(0xffF8F8F8),device: bedroomDevices),
  Room(roomName: "Bedroom", imageUrl: "assets/roomImages/bedroom.jpg", devices: 5, color: Color(0xffFBECDE),device: bedroomDevices),
  Room(roomName: "Bedroom", imageUrl: "assets/roomImages/bedroom.jpg", devices: 5, color: Color(0xffFBECDE),device: bedroomDevices),
];