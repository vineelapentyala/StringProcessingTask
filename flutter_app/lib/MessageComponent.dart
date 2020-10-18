import 'package:flutter/material.dart';

/*
* This is class for the differeent compontents like definition and example that can be added to the dialog box
* In future, this can be reused to include any other attribute related to the word, like Synonyms, to the message box easily
*/

// ignore: must_be_immutable
class MessageComponent extends StatefulWidget{
  String stringType;
  String content;
  MessageComponent ({ Key key, this.stringType,this.content}): super(key: key);
  @override
  _MessageComponentState createState() => _MessageComponentState();
}

class _MessageComponentState extends State<MessageComponent> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: widget.stringType,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold
          ),
        children:[
          TextSpan(
            text: widget.content,
            style:TextStyle(
              fontWeight: FontWeight.w500
            )
          )
        ]
      ),
    );
  }
}