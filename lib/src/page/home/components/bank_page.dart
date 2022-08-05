import 'package:conta_cripto/src/models/card_models.dart';
import 'package:flutter/material.dart';


class BankCard extends StatelessWidget {
  final CardModel card;
  BankCard({required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      width: 252.0,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0, right: 16.0),
                    child: Text(
                      'SALDO',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Text(
                      'R\$ ${card.balance}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  card.accountNumber,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'VALIDO\nATÉ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 10.0, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        card.validDate,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 4.0),
                child: Text(
                  card.name,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 12.0, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class SmallBankCard extends StatelessWidget {
  final CardModel card;
  final double screenWidth;
  SmallBankCard({required this.card, required this.screenWidth});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final bool isLargeScreen = screenWidth > 320;
    final double topPadding = isLargeScreen ? 14.0 : 24.0;
    final EdgeInsets inset = EdgeInsets.only(left: 16.0, top: topPadding);
    return Container(
        height: 88.0,
        width: 150.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: inset,
                        child: Text(
                          card.accountNumber,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: isLargeScreen ? 10.0 : 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 2.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'VALID\nTHRU',
                              textAlign: TextAlign.left,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                card.validDate,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: isLargeScreen ? 10.0 : 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 2.0),
                        child: Text(
                          card.name,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
            GestureDetector(
              child: Image.asset('images/ico_delete_card.png'),
            ),
          ],
        ));
  }
}
