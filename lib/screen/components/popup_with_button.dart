import 'package:flutter/material.dart';

Future<void> popupWithButton(BuildContext context, String title, String message,
    MaterialPageRoute linkTo) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message),
            ],
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.push(
                context,
                linkTo,
              );
            },
          ),
        ],
      );
    },
  );
}
