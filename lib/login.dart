import 'package:examen1_mmoj/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:examen1_mmoj/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  ///APARTADO PARA CREAR VARIABLES
  TextEditingController user = TextEditingController();
  final pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondo2,
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.0), // Esquinas redondeadas
                            color: fondo, // Color de fondo
                          ),
                        )
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          color: fondo2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          color: fondo3,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          color: fondo4,
                        ),

                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.0), // Esquinas redondeadas
                            color: fondo4, // Color de fondo
                          ),
                        )

                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          color: fondo3,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          color: fondo,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          color: fondo2,
                        ),

                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.0), // Esquinas redondeadas
                            color: fondo, // Color de fondo
                          ),
                        )

                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          color: fondo4,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          color: fondo2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          color: fondo3,
                        ),

                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(30.0),
                            child: Container(
                              height: 300, ///Agrega un tamaño al contenedor
                              ///Se puede agregar padding como atributo del contenedor
                              padding: EdgeInsets.all(20.0),
                              //color: Color(0xFFb9a8c), ///Valor hexadecimal del color ------->
                              ///quita las esquina rectangulares por bordes redondeados          Al tener estos dos atributos
                              decoration: BoxDecoration(      ///                                juntos, marcará un error por
                                borderRadius: BorderRadius.circular(40),    ///                  incompatibilidad de atributos
                                color: Colors.white30, /// ------------------------------------>
                              ),
                              child: Column(
                                ///Atributo de Column para indicar el tamaño que debe tener por
                                ///el espacio que ocupan sus hijos widgets
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Bienvenido a tu primer EXAMEN',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                      color: titulos,
                                    ),
                                  ),
                                  const SizedBox(height: 30.0,),
                                  TextFormField(
                                    controller: user,
                                    ///Crear un recuadro más estilizado
                                    decoration: InputDecoration(
                                      ///Agregar un recuadro con bordes redondeado
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide: const BorderSide(
                                            width: 1,
                                            style: BorderStyle.none,
                                          ),
                                        ),
                                        ///Agregar color interno del input
                                        filled: true,
                                        fillColor: Colors.white,
                                        ///Agregar texto de ayuda dentro del input
                                        hintText: 'Correo/Usuario'
                                    ),
                                  ),
                                  const SizedBox(height: 20.0,),
                                  TextFormField(
                                    controller: pass,
                                    obscureText: true, ///Ocultar el texto normal
                                    ///Crear un recuadro más estilizado
                                    decoration: InputDecoration(
                                      ///Agregar un recuadro con bordes redondeado
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide: const BorderSide(
                                            width: 1,
                                            style: BorderStyle.none,
                                          ),
                                        ),
                                        ///Agregar color interno del input
                                        filled: true,
                                        fillColor: Colors.white,
                                        ///Agregar texto de ayuda dentro del input
                                        hintText: 'Contraseña'
                                    ),
                                  ),
                                  const SizedBox(height: 20.0,),
                                  ElevatedButton(
                                    ///Atributo para agregar estilo al botón
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: botones, ///Color al botón
                                      ///Agrega borde redondeado en las esquinas
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      fixedSize: Size(200,40), ///Tamaño que tendrá el botón
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        ///Detectar los cambios de estado de nuestra vista actualsetState(() {
                                        print('Usuario: ${user.text}');
                                        print("Contraseña: " + pass.text);

                                        //SOLO DE INGRESAR CON EL USUARIO USER01 Y PASS01
                                        // Verificar si los campos están vacíos
                                        if (user.text.isEmpty || pass.text.isEmpty) {
                                          // Mostrar Snackbar para datos incompletos
                                          showSnackBar(context, 'Datos incompletos', 3);
                                        } else if (user.text == "test" && pass.text == "FDM1") {
                                          print('Ingreso correctamente');
                                          showSnackBar(context, 'Ingreso correctamente', 3);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => Home()),
                                          );
                                        } else {
                                          print('Usuario y/o Contraseña incorrectos');
                                          showSnackBar(context, 'Usuario y/o Contraseña incorrectos', 3);
                                        }
                                      });
                                    }, ///Función interna
                                    child: const Row(
                                      ///Alinear horizontamente
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      ///Vertical
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                            'INICIAR SESIÓN',
                                          style: TextStyle(
                                            color: Colors.white
                                          ),
                                        ),

                                      ],

                                    ),
                                  ),
                                  const SizedBox(height: 5.0,),
                                  Text('Mi primer examen, ¿estará sencillo?',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )// transparente o sin tamaño//Icon(Icons.home)
                                ],
                              ),
                            ),
                          ),
                      )

                    ],
                )

              )

            ],
          )

        ],
      )
    );
  }
}
void showSnackBar(BuildContext context, String texto, int duracion) {
  final snackBar = SnackBar(
    content: Text(
      texto, // Muestra el texto que se pasa a la función
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: duracion),
    action: SnackBarAction(
      label: 'Cerrar',
      onPressed: () {
        // Cierra el SnackBar manualmente si es necesario
      },
    ),
  );

  // Muestra el SnackBar
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
