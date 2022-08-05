import 'package:conta_cripto/src/page/auth/sign_in_screen.dart';
import 'package:conta_cripto/src/page/home/home_page.dart';
import 'package:conta_cripto/src/page/slider/slider_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:web3dart/web3dart.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simulador ',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: LoginScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Client httoClient;
  late Web3Client ethClient;
  bool data = false;
  int myAmount = 0;
  var myData;
  final myAdress = '0x80B3e3EDc42a6B988862f217Df73f7309e0b1F76';

  @override
  void initState() {
    super.initState();
    httoClient = Client();
    // othClient = Web3Client('https://mainnet.infura.io/v3/7d47b17bcb044e1fb41cef44c2f52956', httpClient);
    // getBalance(myAddress);
  }

  // Método para carregar o Contrado do arquivo abi
  Future<DeployedContract> loadContract() async {
    String abi = await rootBundle.loadString('assets/abi');
    String contractAddress =
        '0xd9145CCE52D386f254917e481eB44e9943F39138'; // Número do Deploy do Contrato

    final contract = DeployedContract(ContractAbi.fromJson(abi, 'PKCOin'),
        EthereumAddress.fromHex(contractAddress));

    return contract;
  }

// Método Consulta usar o arquivo abi.json
  Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
    final contract = await loadContract();
    final ethFunction = contract.function(functionName);
    final result = await ethClient.call(
      contract: contract,
      function: ethFunction,
      params: args,
    );
    return result;
  }

// Método para buscar o Saldo
  Future<void> getBalance(String tagetAddress) async {
    EthereumAddress address = EthereumAddress.fromHex(tagetAddress);
    List<dynamic> result = await query('getBalance', []);

    myData = result[0];
    data = true;
    setState(() {});
  }

  // Método para Enviar transações
  Future<String> submit(String functionName, List<dynamic> args) async {
    EthPrivateKey credentials =
        EthPrivateKey.fromHex('Colocar o número da chave');
    DeployedContract contract = await loadContract();
    final ethFunction = contract.function(functionName);
    final result = await ethClient.sendTransaction(
        credentials,
        Transaction.callContract(
          contract: contract,
          function: ethFunction,
          parameters: args,
        ),
        fetchChainIdFromNetworkId: true);
    return result;
  }

  // Método para buscar Deposito
  Future<String> sendCoin() async {
    var bigAmount = BigInt.from(myAmount);
    var response = await submit('depositBalance', [bigAmount]);
    print('ok foi ');
    return response;
  }

  // Método para buscar Saque
  Future<String> withdrawCoin() async {
    var bigAmount = BigInt.from(myAmount);
    var response = await submit('withdrawBalance', [bigAmount]);
    print('ok peguiei ');
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.purple400,
      body: ZStack([
        VxBox()
            .purple700
            .size(context.screenWidth, context.screenHeight / 4)
            .make(),
        VStack([
          SafeArea(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop(HomePageState());
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
          (context.percentHeight * 0).heightBox,
          '\$Criptomoeda'.text.xl4.white.bold.center.makeCentered().py16(),
          (context.percentHeight / 5).heightBox,
          VxBox(
                  child: VStack([
            'Saldo'.text.white.xl2.semiBold.makeCentered(),
            10.heightBox,
            data
                ? '\$myData'.text.bold.xl6.makeCentered().centered()
                : CircularProgressIndicator().centered()
          ]))
              .purple600
              .size(context.screenWidth, context.screenHeight / 6.8)
              .rounded
              .shadowXl
              .make()
              .p16(),
          30.heightBox,

          // Barra rolante
          SliderWidget(
            min: 0,
            max: 100,
            finalVal: (value) {
              myAmount = (value * 100).round();
            },
          ),

          HStack(
            [
              // Botão refresh
              ElevatedButton.icon(
                onPressed: () => getBalance(myAdress),
                icon: const Icon(Icons.refresh, color: Colors.white),
                label: 'Atualizar'.text.bold.white.make(),
              ).h(45),
              // Botão Depositar
              ElevatedButton.icon(
                onPressed: () {
                  sendCoin();
                },
                icon: Icon(Icons.call_made_rounded, color: Colors.white),
                label: 'Depositar'.text.bold.white.make(),
                style: ElevatedButton.styleFrom(primary: Colors.green[300]),
              ).h(45),
              // Botão Saque
              ElevatedButton.icon(
                onPressed: () => withdrawCoin(),
                icon: Icon(Icons.call_received_rounded, color: Colors.white),
                label: 'Saque'.text.bold.white.make(),
                style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
              ).h(45),
            ],
            alignment: MainAxisAlignment.spaceAround,
            axisSize: MainAxisSize.max,
          ).p1()
        ]),
      ]),
    );
  }
}

// Observação na Pasta assests no arquivo abi, são detalhes de compilação obtidas no Remix. Lógicas e Métodos.


// Positioned(
//                 left: 5,
//                 child: SafeArea(
//                   child: IconButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     icon: const Icon(
//                       Icons.arrow_back_ios,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),