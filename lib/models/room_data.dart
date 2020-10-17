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
  String roomName;
  String deviceName;
  String imageUrl;
  Devices({this.imageUrl, this.deviceName, this.roomName});
}

List<Devices> bedroomDevices= [
  Devices(deviceName: "Light 1", imageUrl: "assets/light1.png", roomName: "Bedroom"),
  Devices(deviceName: "Light 2", imageUrl: "assets/light2.png",roomName: "Bedroom"),
  Devices(deviceName: "Light 3", imageUrl: "assets/light1.png", roomName: "Bedroom"),
  Devices(deviceName: "Fan", imageUrl: "assets/fan.png", roomName: "Bedroom"),
  Devices(deviceName: "AC", imageUrl: "assets/ac.png", roomName: "Bedroom"),
];
List<Devices> bathroomDevices= [
  Devices(deviceName: "Light 1", imageUrl: "assets/light1.png", roomName: "Bathroom"),
  Devices(deviceName: "Fan", imageUrl: "assets/fan.png",roomName: "Bathroom"),
  Devices(deviceName: "Geyser", imageUrl: "assets/geyser.jpg", roomName: "Bathroom"),
];
List<Devices> studyDevices= [
  Devices(deviceName: "Light 1", imageUrl: "assets/light1.png", roomName: "Study"),
  Devices(deviceName: "Fan", imageUrl: "assets/fan.png", roomName: "Study"),
  Devices(deviceName: "AC", imageUrl: "assets/ac.png", roomName: "Study"),
];
List<Devices> storeRoomDevices= [
  Devices(deviceName: "Light 1", imageUrl: "assets/light1.png", roomName: "Store Room"),
  Devices(deviceName: "Light 2", imageUrl: "assets/light2.png", roomName: "Store Room"),
];

List<Devices> livingRoomDevices= [
  Devices(deviceName: "Light 1", imageUrl: "assets/light1.png", roomName: "Living Room"),
  Devices(deviceName: "Light 2", imageUrl: "assets/light2.png", roomName: "Living Room"),
  Devices(deviceName: "Fan", imageUrl: "assets/fan.png", roomName: "Living Room"),
  Devices(deviceName: "Fan", imageUrl: "assets/fan.png", roomName: "Living Room"),
  Devices(deviceName: "AC", imageUrl: "assets/ac.png", roomName: "Living Room"),
];

List<Devices> kitchen= [Devices(deviceName: "Light 1 ", imageUrl: "assets/light1.png", roomName: "Kitchen"),
  Devices(deviceName: "Fan", imageUrl: "assets/fan.png", roomName: "Kitchen"),];


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
  Room(roomName: "Kitchen", imageUrl: "assets/auto.png", devices: 2, color: Color(0xffFBECDE),device: kitchen),
];