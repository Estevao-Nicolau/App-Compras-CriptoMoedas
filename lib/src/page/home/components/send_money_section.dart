import 'package:conta_cripto/main.dart';
import 'package:flutter/material.dart';

class SendMoneySection extends StatefulWidget {
  const SendMoneySection({Key? key}) : super(key: key);

  @override
  State<SendMoneySection> createState() => _SendMoneySectionState();
}

class _SendMoneySectionState extends State<SendMoneySection> {
  double screenWidth = 0.0;

  @override
  Widget build(BuildContext context) {
    var smallItemPadding = const EdgeInsets.all(1);
    if (screenWidth <= 320) {
      smallItemPadding =
          const EdgeInsets.only(left: 10.0, right: 5.0, top: 12.0);
    }
    return Container(
      decoration: const BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
          )
        ],
      ),
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                  child: Text(
                    'Carteira de Criotmoedas',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Usuários Enviados EXpl
          SizedBox(
            height: 100.0,
            child: Card(
              color: Colors.purple.shade200,
              elevation: 20,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: smallItemPadding,
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()));
                          },
                          child: Text(
                            'Comprar',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: smallItemPadding,
                    child: Column(
                      children: const <Widget>[
                        CircleAvatar(
                          child: Text('C'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text('Criotmoeda'),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: smallItemPadding,
                    child: Column(
                      children: const <Widget>[
                        CircleAvatar(
                          child: Text('B'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text('Bitcoin'),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: smallItemPadding,
                    child: Column(
                      children: const <Widget>[
                        CircleAvatar(
                          child: Text('C'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text('Criotmoeda'),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: smallItemPadding,
                    child: Column(
                      children: const <Widget>[
                        CircleAvatar(
                          child: Text('C'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text('Criotmoeda'),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: smallItemPadding,
                    child: Column(
                      children: const <Widget>[
                        CircleAvatar(
                          child: Text('C'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text('Criotmoeda'),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: smallItemPadding,
                    child: Column(
                      children: const [
                        CircleAvatar(
                          child: Text('C'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text('Criotmoeda'),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: smallItemPadding,
                    child: Column(
                      children: const [
                        CircleAvatar(
                          child: Text('C'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text('Criotmoeda'),
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
