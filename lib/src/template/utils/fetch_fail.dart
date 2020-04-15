import 'package:flutter/material.dart';

class FailApi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              'OOPS!',
              style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.red,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 12.0,
            ),
            Text(
              'Internal Server Error',
              style: TextStyle(fontSize: 20.0, color: Colors.redAccent),
            )
          ],
        ),
      ),
      padding: EdgeInsets.only(top: 60.0),
    );
  }
}
