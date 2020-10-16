import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http ;
import 'package:flutterapp/pdfViewPage.dart';
import 'package:flutterapp/TextViewPage.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Word Definition Task',
      // theme: ThemeData(
      //   primarySwatch: Colors.green,
      // ),
      home:TextViewPage()
    );
  }
}

// class MyApp extends StatefulWidget {
//   // This widget is the root of your application.
//   _MyAppState createState() => _MyAppState();
// }
// class _MyAppState extends State<MyApp>{
  
// }

