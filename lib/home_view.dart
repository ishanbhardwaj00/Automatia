import 'package:automatia_second/screens/setup_screen.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/sign_in.dart';
class HomeView extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HomeView> with TickerProviderStateMixin {
  String result=" ";

  Future scanQR(BuildContext context) async {
    var qrResult;
    ScanResult scanResult;
     try {
        scanResult = await BarcodeScanner.scan();
        qrResult= scanResult.rawContent;
        if(qrResult!=" ") {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
            return DestinationScreen();
          }),);
        }

     }
     on PlatformException catch(e) {
       if(e.code==BarcodeScanner.cameraAccessDenied) {
         setState(() {
           result="Permission Denied";
           SnackBar snackBar =SnackBar(content: Text(result),);
           Scaffold.of(context).showSnackBar(snackBar);

         });

       }
     }
     on FormatException {
       setState(() {
         result="Pressed the back button before scanning anything";
         SnackBar snackBar =SnackBar(content: Text(result),);
         Scaffold.of(context).showSnackBar(snackBar);
       });
     }
  }
  Animation animation;
  AnimationController animationController;
  AnimationController boxAnimationController;

  void initState() {
    super.initState();
    animationController= AnimationController(duration: Duration(seconds: 1), vsync: this);
    boxAnimationController=AnimationController(duration: Duration(seconds:2), vsync: this);
    boxAnimationController.addListener(() {
      setState(() {

      });
    });
    animationController.addListener(() {
      setState(() {
      });
    });
    boxAnimationController.forward();
    animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    animation= CurvedAnimation(parent: animationController, curve: Curves.easeIn);
    animation=Tween<double>(begin: 0, end: 32).animate(animation);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(
        builder: (context) {
           return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: MediaQuery.of(context).size.height/2 -animation.value,
                child: Container(
                  width: 270,
                  child: Image(
                    image: AssetImage("assets/text.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                bottom: 80,
                child: Opacity(
                  opacity: boxAnimationController.value,
                  child: RaisedButton(
                    child: Text("SCAN QR"),
                    color: Colors.white,
                    onPressed: () =>scanQR(context),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 40,
                child: Row(
                  children: <Widget>[
                    Container(width: 70, height: 1, color: Colors.grey,),
                    GestureDetector(
                      onTap: () { Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context) => Login(),
                      ));},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text("Already a customer? Sign in here.", style: TextStyle(color: Colors.teal, fontWeight: FontWeight.w600 , fontSize: 12, fontFamily: "Raleway"),),
                      ),
                    ),
                    Container(width: 70, height: 1, color: Colors.blueGrey,),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
