import 'package:flutter/material.dart';

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