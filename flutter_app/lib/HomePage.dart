import 'dart:convert';

// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/TextViewPage.dart';
// import 'package:flutterapp/PDFViewPage.dart';
import 'package:flutterapp/DocViewPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Word Definitions Demo", textAlign: TextAlign.center)
        ),
      ),
      body: Center(
        child:Builder(
          builder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.amber,
                      child: Text("Open Text"),
                      onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TextViewPage()),
                        );
                      }
                    ),
                    SizedBox(height: 20.0),
                    RaisedButton(
                      color: Colors.amber,
                      child: Text("Open Text from .docx"),
                      onPressed: () async{
                        String contentsDoc = await rootBundle.loadString('paragraph.docx');
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DocViewPage(contents:contentsDoc)),
                        );
                      }
                    ),
                  ]
          ),
        ),
      ),
    );
  }
}