import 'package:flutter/material.dart';

class WaveBackground extends StatelessWidget {
  final Widget child;
  const WaveBackground({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image(
                image: AssetImage(
                  'images/bg6.png',
                ),
                fit: BoxFit.fitWidth,
                width: size.width,
              ),
          ),
          child,
        ],
      ),
    );
  }
}