import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:flutterapp/AlertDialogView.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class TextViewPage extends StatefulWidget {
  @override
  _TextViewPageState createState() => _TextViewPageState();
}

class _TextViewPageState extends State<TextViewPage> {
  @override
  Widget build(BuildContext context) {
    String fullText = 'The researchers found that word recall was greatest when the participants read aloud to themselves.\n\n"This study confirms that learning and memory benefit from active involvement," says study author Colin M. MacLeod, a professor and chair of the Department of Psychology at the University of Waterloo.';
    final textSpans = <TextSpan>[];
    fullText.splitMapJoin(
      RegExp('\\w+'),
      onMatch:(m){
        final matchString = m.group(0);
        textSpans.add(TextSpan(
          recognizer: DoubleTapGestureRecognizer()..onDoubleTap = () => showMyDialog(context, matchString),
          text: matchString
        ));
        return matchString;
      },
      onNonMatch:(string){
        textSpans.add(TextSpan(text:string));
        return string;
      },
    );
    return Scaffold(appBar: AppBar(
      title:Text("Word Definitions Demo")),
      body:Center(
        child: SelectableText.rich(
          TextSpan(
            children: textSpans,
            style:TextStyle(
              color: Colors.grey[600],
              fontSize: 20,
            )
          ),
          cursorColor: Colors.green,
          showCursor:true,
        ),
      )
    );
  }
  
  Future<void> showMyDialog(BuildContext context, String displayText)async {
    //check if you can load something just once everytime the user opens?
    Map<dynamic,dynamic> response = jsonDecode(await rootBundle.loadString('wordDef.json'));
    print(response);
    // String plural;
    String def;
    String example;
    if (response.containsKey(displayText)){
      var thisWord = response[displayText];
      def = thisWord['definition'];
      example = thisWord['example'];
    }
    else{
      def = "Not Defined";
      example = "Not Defined";
    }
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(displayText,
          style: TextStyle(fontWeight: FontWeight.w300)),
          shape: RoundedRectangleBorder(
            borderRadius:BorderRadius.all(Radius.circular(10.0))
          ),
          content:Builder(
            builder:(context){
              return Container(
                child:Column(
                  children: [RichText(
                    text: TextSpan(
                      text: "Definition: ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                        ),
                      children:[TextSpan(
                        text: def,
                        style:TextStyle(
                          fontWeight: FontWeight.w400
                        )
                        )
                      ]
                    ),
                  ),
                  SizedBox(
                      height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Example: ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                        ),
                      children:[TextSpan(
                        text: example,
                        style:TextStyle(
                          fontWeight: FontWeight.w400
                        )
                        )
                      ]
                    ),
                  ),]
                ),
                height: 200,
                width: 200
              );
            }
            
          ),
          actions: [
            CloseButton(
              color: Colors.red,
            ), 
          ]
        );
      },
    );
  }
}