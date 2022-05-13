import 'package:flutter/material.dart';

import '../model/pais.dart';

class TelaDetalhes extends StatefulWidget {
  const TelaDetalhes({Key? key}) : super(key: key);

  @override
  State<TelaDetalhes> createState() => _TelaDetalhesState();
}

class _TelaDetalhesState extends State<TelaDetalhes> {
  @override
  Widget build(BuildContext context) {
    //
    // RECUPERAR os dados passados como argumento
    //
    final Pais p = ModalRoute.of(context)!.settings.arguments as Pais;

    return Scaffold(
      appBar: AppBar(
        title: const Text('IBGE'),
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.white24,
      //BODY
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Image.network(
              'https://countryflagsapi.com/png/' + p.abreviatura.toLowerCase(),
            ),
            Text(p.nome, style: const TextStyle(fontSize: 28)),
            Text(p.historico, style: const TextStyle(fontSize: 20))
          ],
        ),
      ),

      //
      // Floating Action Button
      //
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.favorite),
        backgroundColor: Colors.black87,
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'O ${p.nome.toUpperCase()} foi adicionado aos favoritos.',
              ),
              duration: const Duration(seconds: 3),
            ),
          );

          Navigator.pop(context);
        },
      ),
    );
  }
}
