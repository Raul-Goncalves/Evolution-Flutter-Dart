import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  void _restField(){
    pesoController.text="";
    alturaController.text="";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(50, 0.0 , 50, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.person, size: 120, color: Colors.indigo),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: "Peso (KG)",
                  labelStyle: TextStyle(color: Colors.indigo)),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.indigo, fontSize: 25.0),
              controller: pesoController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: "Altura (CM)",
                  labelStyle: TextStyle(color: Colors.indigo)),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.indigo, fontSize: 25.0),
              controller: alturaController,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: SizedBox(
                height: 80,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigo,
                    ),
                    onPressed: ( ) { },
                    child: const Text("Calcular", style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                ),
              ),
            ),
            const Text("Informe seu PESO/ALTURA",textAlign: TextAlign.center,style: TextStyle(color: Colors.indigo,fontSize: 25.0),)
          ],
        ),
      ),
    );
  }
}
