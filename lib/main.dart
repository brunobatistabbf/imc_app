import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();

  String _calculo = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("IMC APP"),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 30.0),
            width: 80.0,
            height: 80.0,
            child: const Image(image: AssetImage("images/peso2.png")),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(30, 10, 20, 10),
            child: TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: "Insira seu peso",
                  prefix: Text("Kg "),
                  labelStyle: TextStyle(color: Colors.grey)),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(30, 10, 20, 10),
            child: TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: "Insira sua altura",
                  prefix: Text("Ex: 1.80 "),
                  labelStyle: TextStyle(color: Colors.grey)),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            height: 50,
            width: 200,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 200, 0)),
              onPressed: () {
                double peso = double.parse(pesoController.text);
                double altura = double.parse(alturaController.text);

                double calculo = peso / (altura * altura);

                setState(() {
                  if (calculo < 18.5) {
                    _calculo = "Abaixo do Peso";
                  }
                  if (calculo > 18.6 && calculo < 24.9) {
                    _calculo = "Peso Ideal(Parabéns)";
                  }
                  if (calculo > 25 && calculo < 29.9) {
                    _calculo = "Levemente acima do peso";
                  }
                  if (calculo > 30 && calculo < 34.5) {
                    _calculo = "Obesidade grau I";
                  }
                  if (calculo > 35 && calculo < 39.9) {
                    _calculo = "Obesidade grau II(Severa)";
                  }
                  if (calculo > 40) {
                    _calculo = "Obesidade III(Mórbida)";
                  }
                });
              },
              child: const Text(
                "Calcular",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: Text(
              _calculo,
              style: const TextStyle(fontSize: 30, color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
