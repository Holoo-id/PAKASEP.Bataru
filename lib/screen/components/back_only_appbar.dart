import 'dart:io' show Platform;

import 'package:flutter/material.dart';

class BackOnlyAppbar extends StatelessWidget {
  final Widget child;
  const BackOnlyAppbar({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return AppBar(
        leadingWidth: 75,
        toolbarHeight: 65,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Container(
          margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
          width: 55,
          height: 55,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              border: Border.all(color: Color(0xffe5e5e5))),
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xff3F414E),
              size: 30,
            ),
          ),
        ),
      );
    } else {
      return Container(height: 0, width: 0);
    }
  }
}
