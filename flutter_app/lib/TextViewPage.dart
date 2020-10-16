import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/AlertDialogView.dart';

class TextViewPage extends StatefulWidget {
  @override
  _TextViewPageState createState() => _TextViewPageState();
}

class _TextViewPageState extends State<TextViewPage> {
  @override
  Widget build(BuildContext context) {
    String fullText = 'The researchers found that word recall was greatest when the participants read aloud to themselves.\n\n"This study confirms that learning and memory benefit from active involvement," says study author Colin M. MacLeod, a professor and chair of the Department of Psychology at the University of Waterloo.';
    String smallText = "The Researchers";
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
    return Scaffold(appBar: AppBar(title:Text("Word Definitions Demo")),
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
    // return Scaffold(
    //   appBar: AppBar(title: Text(" Word Definitions Demo")),
    //   body:Center(
    //       child: GestureDetector(
    //                   onDoubleTap:()=>showMyDialog(context,smallText),
    //                   child: Card(
    //                     child: Padding(
    //                       padding: const EdgeInsets.all(10.0),
    //                       child: Text(smallText)
    //                     )
    //                   )
    //                 //   child: SelectableText.rich(
    //                 //   TextSpan(),
    //                 //   style:TextStyle(
    //                 //     color: Colors.grey[600],
    //                 //     fontSize: 20,
    //                 //     decoration: TextDecoration.none
    //                 //   ),
    //                 //   cursorColor: Colors.green,
    //                 //   showCursor:true,
    //                 //   toolbarOptions: ToolbarOptions(
    //                 //     copy: true,
    //                 //     selectAll: false,
    //                 //     cut: false,
    //                 //     paste: false
    //                 //   ),
    //                 // ),
    //               )
    //             )
    //   );
  }
  Future<void> showMyDialog(BuildContext context, String displayText) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(displayText),
          actions: [
            CloseButton()
          ]
        );
      },
    );
  }
}