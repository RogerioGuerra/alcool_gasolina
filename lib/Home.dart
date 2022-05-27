import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controllerAlcool = TextEditingController();
  final TextEditingController _controllerGasolina = TextEditingController();
  var _textoResultado = "";

  void _calcularOpcao() {
    double? valorAlcool = double.tryParse(_controllerAlcool.text);
    double? valorGasolina = double.tryParse(_controllerGasolina.text);
    if (valorGasolina == null || valorAlcool == null) {
      setState(() {
        _textoResultado =
            "Use valor maior que zero e ponto(.) para as casas decimais!";
      });
    } else {
      if ((valorAlcool / valorGasolina) >= 0.7) {
        setState(() {
          _textoResultado = "Abasteça com Gasolina";
        });
      } else {
        setState(() {
          _textoResultado = "Abasteça com Alcool";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alcool ou Gasolina?"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //para ocupar o espaço
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Image.asset("imagens/logo.png"),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Saiba qual a melhor opção",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "preço alcool, ex:5.59"),
              style: const TextStyle(fontSize: 22),
              controller: _controllerAlcool,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: "preço gasolina, ex:7.59"),
              style: const TextStyle(fontSize: 22),
              controller: _controllerGasolina,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                  primary: Colors.green,
                ),
                onPressed: _calcularOpcao,
                child: const Text(
                  "Calcular",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                _textoResultado,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
