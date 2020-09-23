// import 'package:challengeChat/views/signin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Hello world")),
        body: Center(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                child: Image(
                  image: AssetImage("assets/images/bitacora.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Container(
                  width: double.infinity,
                  height: 80,
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: Text(
                      'Hello Rai',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
