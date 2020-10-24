import 'package:automatia_second/homepage.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String user, pass;
  final formKey = GlobalKey<FormState>();
  TextEditingController textEditingControllerUser = TextEditingController();
  TextEditingController textEditingControllerPass= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image(
              image: AssetImage("assets/regbg.jpg"),
              fit: BoxFit.cover,
            ),
            Opacity(
              opacity: 0.93,
              child: Container(
                // color: Theme.of(context).scaffoldBackgroundColor,
                color: Colors.white,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  height: 150,
                  width: 150,
                  image: AssetImage("assets/newlogo.png"),
                ),
                SizedBox(height: 50,),
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 250,
                        child: TextFormField(
                          validator: (value) {
                            return value.isEmpty? "Please enter a valid email" : null;
                          },
                          decoration: InputDecoration(
                            labelText: "EMAIL ID",
                            labelStyle: TextStyle(color: Color(0xff417F83), fontFamily: "Raleway", fontSize: 14,),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                          ),
                        ),
                      ),
                      Container(
                        width: 250,
                        child: TextFormField(
                          validator: (value) {
                            return value.isEmpty? "Oops! You can't leave this field empty" : null;
                          },
                          decoration: InputDecoration(
                            labelText: "PASSWORD",
                            labelStyle: TextStyle(color: Color(0xff417F83), fontFamily: "Raleway", fontSize: 14, ),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: 250,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text("Forgot password?", style: TextStyle(color: Colors.grey, fontFamily: "Raleway"),),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Material(
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        clipBehavior: Clip.hardEdge,
                        child:InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) => Homepage()));
                              if(formKey.currentState.validate()) {
                                user= textEditingControllerUser.text;
                                pass= textEditingControllerPass.text;
                              }
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
                                  color: Colors.white,
                                ),
                                width: 240,
                                height: 45,
                                child: Container(
                                    alignment: Alignment.center,
                                    child: Text("SIGN UP ", style: TextStyle(color: Color(0xff457224),fontSize: 18, fontFamily: "Raleway", fontWeight: FontWeight.bold),)
                                )
                              )
                          ),
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(width: 70, height: 1, color: Colors.grey,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text("OR CONNECT WITH.", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600 , fontSize: 12, fontFamily: "Raleway"),),
                          ),
                          Container(width: 70, height: 1, color: Colors.blueGrey,),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                         Container(height: 60,width: 60,
                         decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           color: Colors.white,
                           boxShadow: [
                             BoxShadow(
                               blurRadius: 6.0,
                               offset: Offset(0,2),
                               color: Colors.black54,
                             ),
                           ],
                           image: DecorationImage(image: AssetImage("assets/facebook_logo.png") ),
                         ),),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Text("OR", style: TextStyle(color: Colors.grey),),
                          ),
                          Container(height: 60,width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 6.0,
                                  offset: Offset(0,2),
                                  color: Colors.black54,
                                ),
                              ],
                              image: DecorationImage(image: AssetImage("assets/googleg.jpg") ),
                            ),), ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
