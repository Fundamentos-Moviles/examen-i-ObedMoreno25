import 'package:flutter/material.dart';
class More_info extends StatefulWidget {
  const More_info({super.key});

  @override
  State<More_info> createState() => _More_infoState();
}

class _More_infoState extends State<More_info> {
  List<Widget> boxes = []; // Lista para almacenar los recuadros
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Agregar recuadros'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                // Aquí se irán agregando las filas de contenedores
                Expanded(
                  child: Column(
                    children: [
                      // Cada vez que haya una fila completa de contenedores, se actualiza aquí
                      if (boxes.isNotEmpty)
                        Expanded(
                            child:Row(
                              children: boxes.map((box) {
                                return Expanded(child: box);
                              }).toList(),
                            ),)

                    ],
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                // Agregar un recuadro nuevo cada vez que se presiona el botón
                boxes.add(
                 Container(
                    height: 250, // Altura fija del recuadro
                    margin: EdgeInsets.only(right: 1.0, left: 1.0),
                    color: Colors.blue, // Color del recuadro
                  ),
                );

                // Si hay más de 12 recuadros, comenzamos una nueva fila
                if (boxes.length > 12) {
                  boxes.removeAt(0); // Remover el recuadro más antiguo
                }
              });
            },
            child: const Text('Agregar recuadro'),
          ),
        ],
      ),
    );
  }
}