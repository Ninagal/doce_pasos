import 'package:doce_pasos/pages/home_page.dart';
import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

class MiCalendarioSobriedad extends StatelessWidget {
  const MiCalendarioSobriedad({super.key});

  @override
  Widget build(BuildContext context) {
    return const CalendarioSobriedad();
  }
}

class CalendarioSobriedad extends StatefulWidget {
  const CalendarioSobriedad({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalendarioSobriedadState createState() => _CalendarioSobriedadState();
}

class _CalendarioSobriedadState extends State<CalendarioSobriedad> {
  //* Fecha primer dia de sobriedad
  String _fecha = DateTime.now().toString();

  @override
  void initState() {
    super.initState();
    _loadFecha();
  }

  void _loadFecha() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _fecha = prefs.getString('fecha') ?? DateTime.now().toString();
    });
  }

  //* funcion para cerrar con confirmar
  void cerrar() {
    Navigator.of(context).pop();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  //* funcion para cerrar con confirmar
  void reincidir() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => prefs.setString('fecha', DateTime.now().toString()));
  }

  //* Dialogo que se abre para llenar la informacion del icono perfil
  Future openDialog() => showDialog(
      context: context,
      builder: (context) => Dialog(
          alignment: Alignment.topCenter,
          backgroundColor: const Color.fromARGB(255, 236, 232, 164),
          shadowColor: Colors.black38,
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20.0),
                  margin: const EdgeInsets.all(5.0),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 241, 161, 12),
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black87,
                          spreadRadius: -1.0,
                          blurRadius: 7.0,
                        )
                      ]),
                  child: Column(
                    children: [
                      const Text(
                        'Primer Dia de Sobriedad',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.black, elevation: 20),
                        onPressed: () async {
                          DateTime? picked = await showDatePicker(
                            context: context,
                            locale: const Locale('es'),
                            initialDate: DateTime.parse(_fecha),
                            firstDate: DateTime(1960),
                            lastDate: DateTime.now(),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: const ColorScheme.light(
                                    primary: Colors.amberAccent, // <-- SEE HERE
                                    onPrimary: Color.fromARGB(
                                        255, 188, 39, 207), // <-- SEE HERE
                                    onSurface: Color.fromARGB(
                                        255, 241, 161, 12), // <-- SEE HERE
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      foregroundColor: const Color.fromARGB(255,
                                          188, 39, 207), // button text color
                                    ),
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );
                          cambiarfecha(picked);
                          cerrar();
                        },
                        child: const Text(
                          'Elige una Fecha',
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.black, elevation: 20),
                        onPressed: cerrar,
                        child: const Text('Cerrar',
                            style: TextStyle(
                                fontSize: 15.0, color: Colors.black))),
                    const SizedBox(height: 10.0),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.black,
                            elevation: 20,
                            backgroundColor:
                                const Color.fromARGB(255, 248, 75, 53)),
                        onPressed: () {
                          reincidir();
                          cerrar();
                        },
                        child: const Text('Reincidencia',
                            style: TextStyle(
                                fontSize: 15.0, color: Colors.white))),
                  ],
                )
              ],
            ),
          ))));

  Future<void> cambiarfecha(picked) async {
    final prefs = await SharedPreferences.getInstance();
    if (picked == null) return;
    setState(() => prefs.setString('fecha', picked.toString()));
  }

  @override
  Widget build(BuildContext context) {
    //* Calculadora de tiempo sobrio
    Duration diff = DateTime.now().difference(DateTime.parse(_fecha));
    int days = diff.inDays;
    int years = days ~/ 365;
    int months = (days - (years * 365)) ~/ 30;
    int dias = (days - (years * 365) - (months * 30));
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black87,
              spreadRadius: -1.0,
              blurRadius: 12.0,
            )
          ],
          color: Color.fromARGB(255, 211, 228, 208),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0))),
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.calendar_today_rounded,
                  color: Color.fromARGB(255, 241, 161, 12),
                  size: 35.0,
                ),
                tooltip: 'Perfil',
                onPressed: () {
                  openDialog();
                },
              ),
              Text(
                " $years Años $months Meses $dias Dias Sobrio",
                style: const TextStyle(
                  fontSize: 13.0,
                  fontFamily: 'Arial',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
