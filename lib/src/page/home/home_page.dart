
import 'package:conta_cripto/src/page/home/components/send_money_section.dart';
import 'package:conta_cripto/src/page/home/components/user_cards.dart';
import 'package:conta_cripto/src/page/home/components/user_info.dart';
import 'package:conta_cripto/src/page/home/components/utilites_section.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  double screenWidth = 0.0;
//  EdgeInsets smallItemPadding;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return UserInfo(); // Informação do usuário
          } else if (index == 1) {
            return UserCards(); 
          } else if (index == 2) {
            return SendMoneySection(); // Enviar Valor
          } else {
            return UtilitesSection(); // Serviços
          }
        },
      ),
    );
  }
}