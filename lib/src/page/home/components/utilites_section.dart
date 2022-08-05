import 'package:flutter/material.dart';

class UtilitesSection extends StatefulWidget {
  const UtilitesSection({Key? key}) : super(key: key);

  @override
  State<UtilitesSection> createState() => _UtilitesSectionState();
}

class _UtilitesSectionState extends State<UtilitesSection> {
  double screenWidth = 0.0;
  @override
  Widget build(BuildContext context) {
    var smallItemPadding = EdgeInsets.all(12);
    if (screenWidth <= 320) {
      smallItemPadding = EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0);
    }
    return Container(
      color: Colors.deepPurple,
      margin: EdgeInsets.all(13.0),
//      height: 200.0,
      child: Column(
        children: <Widget>[
          Row(
            children: const [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Serviços',
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 80.0,
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: smallItemPadding,
                    child: Column(
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child:
                              Text('NFts', style: TextStyle(fontSize: 20.0)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: smallItemPadding,
                    child: Column(
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Duvidas',
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
