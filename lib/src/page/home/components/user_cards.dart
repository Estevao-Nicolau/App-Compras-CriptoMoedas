import 'package:conta_cripto/src/models/card_models.dart';
import 'package:conta_cripto/src/page/home/components/bank_page.dart';
import 'package:conta_cripto/src/page/home/components/category_pagecategory_page.dart';
import 'package:flutter/material.dart';


class UserCards extends StatefulWidget {
  const UserCards({Key? key}) : super(key: key);

  @override
  State<UserCards> createState() => _UserCardsState();
}

final List<CardModel> cards = [
  CardModel('Nicolau', '4221 5168 7464 2283', '08/25', 1000),
  CardModel('Nicolau', '4221 5168 7464 2283', '08/26', 3500),
  CardModel('Nicolau', '4221 5168 7464 2283', '08/23', 5678),
  CardModel('Nicolau', '4221 5168 7464 2283', '08/22', 580),
];

class _UserCardsState extends State<UserCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
            child: Text(
              'Minhas contas bancária',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            height: 166.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return _getBankCard(index);
              },
            ),
          ),
          Container(
            height: 80.0,
            margin:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
            child: MyWidget(),
          )
        ],
      ),
    );
  }
}

_getBankCard(int index) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: BankCard(card: cards[index]),
  );
}
