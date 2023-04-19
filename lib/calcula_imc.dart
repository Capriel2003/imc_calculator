import 'package:flutter/material.dart';

class ImcCalculator extends StatefulWidget {
  const ImcCalculator({super.key});

  @override
  State<ImcCalculator> createState() => Calculadora();
}

class Calculadora extends State<ImcCalculator> {
  final TextEditingController _pesot = TextEditingController();
  final TextEditingController _alturat = TextEditingController();
  String _resp = '';
  String _posicao = '';

  void _calcularIMC() {
    double peso = double.tryParse(_pesot.text) ?? 0;
    double altura = double.tryParse(_alturat.text) ?? 0;
    double comp = peso / (altura * altura);

    setState(() {
      _resp = 'Seu IMC = ${(comp).toStringAsFixed(2)}';
      if (comp >= 40) {
        _posicao = 'Você está na categoria : Obesidade Grau 3';
      } else if (comp >= 35) {
        _posicao = 'Você está na categoria : Obesidade Grau 2';
      } else if (comp >= 30) {
        _posicao = 'Você está na categoria : Obesidade Grau 1';
      } else if (comp >= 25) {
        _posicao = 'Você está na categoria : Sobrepeso';
      } else if (comp >= 18.5) {
        _posicao = 'Você está na categoria : Peso Normal';
      } else {
        _posicao = 'Você está na categoria : Abaixo do Peso';
      }
    });
  }

  @override
  void dispose() {
    _pesot.dispose();
    _alturat.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            TextField(
              controller: _pesot,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Insira seu peso: ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.all(16.0),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _alturat,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Insira sua altura: ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.all(16.0),
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _calcularIMC,
              child: const Text('Calcular IMC'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900],
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 32.0),
            Text(
              _resp,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontStyle: FontStyle.italic,
                letterSpacing: 1.0,
                wordSpacing: 5.0,
              ),
            ),
            Text(
              _posicao,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 0, 0),
                fontStyle: FontStyle.italic,
                letterSpacing: 1.0,
                wordSpacing: 5.0,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Image.network(
                    fit: BoxFit.cover,
                    height: 290,
                    'https://scontent.fcnf1-1.fna.fbcdn.net/v/t1.6435-9/120223673_4668104049896783_6039639385065267447_n.png?_nc_cat=104&ccb=1-7&_nc_sid=730e14&_nc_ohc=nxhWROljBkoAX-XiDRe&_nc_ht=scontent.fcnf1-1.fna&oh=00_AfAAesr2cHReUHXYlwqB9XVK1I0QgRRF4fYEUeS7LNTJaQ&oe=6467DDB6'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
