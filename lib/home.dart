import 'package:flutter/material.dart';
import 'package:examen1_mmoj/more_info.dart';
import 'package:examen1_mmoj/utils/constants.dart' as con;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List lista;

  @override
  ///Cada inicie la vista carga/actualiza las variables
  ///primera acción antes de cargar toda la vista
  void initState() {
    //lista = con.lista; ///Lista inmutable o de tipo que no permita tener cambios
    lista = List.from(con.lista); // Crea una copia mutable de la lista original
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///Forma de obtener el tamaño de nuestra pantalla
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: con.fondo2,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity, // Asegura que ocupe todo el ancho
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.only(bottom: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white, // Cambia el color según tu diseño
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center, // Centra el contenido horizontalmente
                      children: [
                        Text(
                          'Notificaciones de actividades',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // Cambia el color del texto
                          ),
                          textAlign: TextAlign.center, // Centra el texto
                        ),
                        SizedBox(height: 10), // Espacio entre los textos
                        Text(
                          'Nombre del alumno: Obed Josafat Moreno Muñoz',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black, // Cambia el color del texto
                          ),
                          textAlign: TextAlign.center, // Centra el texto
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20), // Espacio entre el título y el ListView
                  Container(
                    height: size.height, // 100%
                    width: size.width, // 100%
                    padding: EdgeInsets.all(20.0),
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: lista.length,
                      itemBuilder: (BuildContext context, int index) {
                        var datos = lista[index].toString().split('#');
                        print('ID: ${datos[0]}');

                        return datos[5] == '1'
                            ? CreateCard(
                          numero: datos[1],
                          titulo: datos[2],
                          descripcion: datos[3],
                          numeroEstrellas: datos[4],
                          id: datos[0],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => More_info(), // Asegúrate de pasar el id si lo necesitas
                              ),
                            );
                          },
                        )
                            : createdCard2(
                          int.parse(datos[1]),
                          datos[2],
                          datos[3],
                          int.parse(datos[0]),
                          int.parse(datos[4]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }

  Container createdCard2(int numero, String titulo, String descripcion, int id, int numEstrellas) {
    return Container(
      height: 160.0,
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 8, // Porción mayor para textos
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(numero.toString(),
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(titulo,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                Text("NOTA: $descripcion",
                  overflow: TextOverflow.ellipsis,
                ),
                Spacer(), // Esto empuja las estrellas hacia abajo
                Row(
                  mainAxisAlignment: MainAxisAlignment.end, // Alinea las estrellas a la derecha
                  children: _buildStars(numEstrellas.toString()), // Agrega las estrellas aquí
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4, // Porción menor para los botones
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Navegar a la pantalla more_info
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => More_info(), // Asegúrate de pasar cualquier dato necesario
                      ),
                    );
                  },
                  icon: Icon(Icons.visibility),
                  label: Text('Ver más'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      int indexToRemove = id - 1; // Convierte el ID a índice

                      // Lista de números que no se pueden eliminar
                      List<int> nonRemovableNumbers = [10, 15, 20, 23];

                      // Verificamos si el número se encuentra en la lista de no removibles
                      if (nonRemovableNumbers.contains(numero)) {
                        // Si el número no se puede eliminar, muestra un Snackbar
                        showSnackBar('No se puede eliminar el elemento con el número: $numero', 5);
                      } else {
                        // Si se puede eliminar, verifica el índice
                        if (indexToRemove >= 0 && indexToRemove < lista.length) {
                          lista.removeAt(indexToRemove);
                          showSnackBar('Se eliminó el elemento con el número: $numero', 5);
                        } else {
                          print("ID fuera de rango: $indexToRemove");
                        }
                      }
                    });
                  },
                  icon: Icon(Icons.delete),
                  label: Text('Borrar'),
                ),



              ],
            ),
          ),
        ],
      ),
    );
  }



  ///AREA PARA LAS FUNCIONES
  void showSnackBar(String texto, int duracion) {
    final  snackBar = SnackBar(
      content: Text(texto),
      duration: Duration(seconds: duracion),
      action: SnackBarAction(
        onPressed: () {
          // Cualquier acción al dar clic sobre el widget
        },
        label: 'Cerrar',
      ),
    );

    // Muestra el SnackBar usando ScaffoldMessenger
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class CreateCard extends StatelessWidget {
  final String numero;
  final String titulo;
  final String descripcion;
  final String numeroEstrellas;
  final String id;
  final VoidCallback onTap; // Agrega este parámetro

  const CreateCard({
    super.key,
    required this.numero,
    required this.titulo,
    required this.descripcion,
    required this.numeroEstrellas,
    required this.id,
    required this.onTap, // Requiere la función
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Usa el callback aquí
      child: Container(
        height: 160,
        margin: EdgeInsets.only(bottom: 20.0),
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 11,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        numero,
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        titulo,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        "NOTA: $descripcion",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.event_available),
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: _buildStars(numeroEstrellas), // Llama a la función aquí
            ),
          ],
        ),
      ),
    );
  }
}



// Función para generar las estrellas
List<Widget> _buildStars(String estrellas) {
  int numEstrellas = int.tryParse(estrellas) ?? 0; // Convierte el string a int
  List<Widget> stars = [];

  for (int i = 0; i < 5; i++) {
    stars.add(
      Icon(
        i < numEstrellas ? Icons.star : Icons.star_border,
        size: 20.0,
        color: Colors.yellow,
      ),
    );
  }

  return stars;
}