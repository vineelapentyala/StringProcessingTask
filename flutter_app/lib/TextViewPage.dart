import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/MessageComponent.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

/*
 * This class is the Text View Page Widget that shows up when either of the buttons in the Home Page is clicked
 * The text on this page is selctable and when the user double clicks on a word, a query is made to the local .json file 
 * If this word is present in the json, a dialog box with the word, its definition and an example are displayed
 * If it is not present in the json, a dialog box with the word and the text "Not Defined" next to definition and Example is displayed
*/
class TextViewPage extends StatefulWidget {
  final String contents;
  const TextViewPage ({ Key key, this.contents}): super(key: key);
  @override
  _TextViewPageState createState() => _TextViewPageState();
}

class _TextViewPageState extends State<TextViewPage> {
  @override
  Widget build(BuildContext context) {
    String fullText = widget.contents;
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
        title: Center(
          child: Text("Word Definitions Demo", textAlign: TextAlign.center)
        ),
      ),
      body:Column(children:<Widget>[SizedBox(height:100),Center(
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
      )],)
    );
  }
  
  Future<void> showMyDialog(BuildContext context, String displayText)async {
    //check if you can load something just once everytime the user opens?
    Map<dynamic,dynamic> response = jsonDecode(await rootBundle.loadString('wordDef.json'));
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
        return SimpleDialog(
          title: Text(displayText,
            style: TextStyle(fontWeight: FontWeight.w300)
          ),
          shape: RoundedRectangleBorder(
            borderRadius:BorderRadius.all(Radius.circular(10.0))
          ),
          children:<Widget>[
            SimpleDialogOption(
              child: MessageComponent(stringType:"Definition: ", content: def)
            ),
            SizedBox(height:20.0),
            SimpleDialogOption(
              child: MessageComponent(stringType:"Example: ", content: example)
            ),
            SimpleDialogOption(
              child:RaisedButton(
                onPressed: () => Navigator.pop(context),
                child:Text(
                  "Close",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  )
                ),
                color: Colors.amber,
                hoverColor: Colors.red,
                padding: const EdgeInsets.symmetric(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                )
              )
            ),
          ],
        );
      },
    );
  }
}