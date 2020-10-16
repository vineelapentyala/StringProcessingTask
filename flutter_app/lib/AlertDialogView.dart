import 'package:flutter/material.dart';

class AlertDialogView extends StatefulWidget{
  @override
  _AlertDialogViewState createState() => _AlertDialogViewState();
}

class _AlertDialogViewState extends State<AlertDialogView> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:Text("Message"),
      content: Text("Definition"),
      actions: [
        CloseButton()
      ],
    );
  }
}