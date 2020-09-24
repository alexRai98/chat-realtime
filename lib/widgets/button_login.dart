import 'package:flutter/material.dart';

class ButtonLogin extends StatelessWidget {
  int bgColor;
  String urlLogo;
  String text;
  int textColor;
  ButtonLogin(this.bgColor, this.urlLogo, this.text, this.textColor);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 15),
        color: Color(bgColor),
        onPressed: () {},
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              urlLogo,
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                text,
                style: TextStyle(color: Color(textColor), fontSize: 20),
              ),
            ),
          ],
        ));
  }
}
