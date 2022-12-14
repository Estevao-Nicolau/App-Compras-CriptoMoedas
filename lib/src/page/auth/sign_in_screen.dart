import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:conta_cripto/src/config/theme_colors.dart';
import 'package:conta_cripto/src/page/auth/components/custom_text_form_field.dart';
import 'package:conta_cripto/src/page/auth/sign_up_sreen.dart';
import 'package:conta_cripto/src/page/home/home_page.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passController = TextEditingController();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwathColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: <Widget>[
              // Logo
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontSize: 40,
                        ),
                        children: [
                          // Nome do App
                          TextSpan(
                            text: 'Purple',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'Dog',
                            style: TextStyle(
                              color: CustomColors.customContrastColorLogo,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    // Anima????o do segundo titulo
                    SizedBox(
                      height: 30,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                        child: AnimatedTextKit(
                          pause: Duration.zero,
                          repeatForever: true,
                          animatedTexts: [
                            FadeAnimatedText('Bitcoin'),
                            FadeAnimatedText('Ethereum'),
                            FadeAnimatedText('Tether'),
                            FadeAnimatedText('Solana'),
                            FadeAnimatedText('USD Coin'),
                            FadeAnimatedText('Ethereum Classic'),
                            FadeAnimatedText('Cronos'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Formul??rio
              Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 32,
                  ),
                  decoration: BoxDecoration(
                    color: CustomColors.customContrastColor2,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(45),
                    ),
                  ),
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Email
                        const CustomFormTextField(
                          icon: Icons.email,
                          // controller: emailController,
                          label: "Email",
                          isDense: true,
                          keyType: TextInputType.emailAddress,
                          // validator: (email) {
                          //   if (email == null || email.isEmpty)
                          //     return 'Digite seu email';
                          //   return null;
                          // },
                        ),
                        // Senha
                        const CustomFormTextField(
                          icon: Icons.lock,
                          // controller: passController,
                          label: "Senha",
                          isDense: false,
                          isSecret: true,
                          keyType: TextInputType.visiblePassword,
                          // validator: (password) {
                          //   if (password == null || password.isEmpty)
                          //     return 'Digite sua Senha';
                          //   if (password.length < 5)
                          //     return 'Digite uma senha com pelo menos 7 caracteres';
                          //   return null;
                          // },
                        ),
                        // Bot??o de Entrar
                        SizedBox(
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            },
                            child: const Text(
                              'Entrar',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        // Esqueceu a Senha
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: null,
                            child: Text(
                              'Esqueceu a Senha?',
                              style: TextStyle(
                                  color: CustomColors.customContrastColorLogo),
                            ),
                          ),
                        ),
                        // Divisor
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 1),
                          child: Row(
                            children: const <Widget>[
                              Expanded(
                                child: Divider(
                                  color: Colors.black,
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Text('ou'),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.black,
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Bot??o de Novo User
                        SizedBox(
                          height: 40,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (c) {
                                  return SignUpScreen();
                                }),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                width: 2,
                                color: CustomColors.customContrastColorLogo,
                              ),
                            ),
                            child: Text('Criar Conta'),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
