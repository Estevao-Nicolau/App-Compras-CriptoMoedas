import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    child: Text('foto'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: const Text(
                    'Nicolau',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          ),
          Stack(children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.notifications_none,
                size: 25.0,
              ),
            ),
            Positioned(
              // draw a red marble
              top: 3.0,
              left: 3.0,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFE95482),
                    borderRadius: BorderRadius.circular(8.0)),
                child: const Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Text(
                    '10',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.0,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }
}