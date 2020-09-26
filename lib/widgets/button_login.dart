import 'package:flutter/material.dart';

class ButtonLogin extends StatefulWidget {
  final int bgColor;
  final String urlLogo;
  final String text;
  final int textColor;
  final VoidCallback onPressed;

  ButtonLogin(
      {Key key,
      @required this.onPressed,
      this.bgColor,
      this.urlLogo,
      this.text,
      this.textColor});

  @override
  _ButtonLoginState createState() => _ButtonLoginState();
}

class _ButtonLoginState extends State<ButtonLogin> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 15),
        color: Color(widget.bgColor),
        onPressed: widget.onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.urlLogo,
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                widget.text,
                style: TextStyle(color: Color(widget.textColor), fontSize: 20),
              ),
            ),
          ],
        ));
  }
}
