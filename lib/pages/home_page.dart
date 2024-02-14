import 'package:doce_pasos/data/database.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'asistencia_juntas.dart';
import 'calendario_sobriedad.dart';
import 'dia_hoy.dart';
import 'maindrawer.dart';
import 'nombre_inicio.dart';
import 'practica_espiritual.dart';
import 'practica_programa.dart';

class MiHomePage extends StatelessWidget {
  const MiHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    if (_saveddatebox.get("SAVEDDATE") == null) {
      dbsaveddate.createInitialsaveddate();
    } else {
      dbsaveddate.loadsaveddate();
    }
    if (_savedyearbox.get("SAVEDYEAR") == null) {
      dbsavedyear.createInitialsavedyear();
    } else {
      dbsavedyear.loadsavedyear();
    }
    super.initState();
  }

  final _saveddatebox = Hive.box('saveddatebox');
  SavedDateDataBase dbsaveddate = SavedDateDataBase();
  final _savedyearbox = Hive.box('savedyearbox');
  SavedYearDataBase dbsavedyear = SavedYearDataBase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 211, 228, 208)),
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.checklist_rtl,
              size: 35,
            ),
          );
        }),
        title: const DiaHoy(),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.question_mark,
              size: 35,
            ),
            tooltip: 'Instrucciones',
            onPressed: _launchUrl,
          )
        ],
        toolbarHeight: 60,
        backgroundColor: const Color.fromARGB(255, 101, 148, 47),
      ),
      body: Container(
        height: double.infinity,
        color: const Color.fromARGB(255, 101, 148, 47),
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 10),
              child: Container(
                  color: const Color.fromARGB(255, 101, 148, 47),
                  child: const IconosInicio()),
            ),

            //* Seccion con calendario de tiempo de sobriedad
            const CalendarioSobriedad(),
            //* Cuatro botones principales en main page
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PensamientoDia(),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black87,
                          spreadRadius: -1.0,
                          blurRadius: 13.0,
                        ),
                      ]),
                  margin: const EdgeInsets.only(
                    top: 20.0,
                  ),
                  height: 100,
                  width: 300,
                  child: FloatingActionButton.extended(
                    heroTag: "espiritual",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MiPracticaEspiritual()),
                      );
                    },
                    backgroundColor: const Color.fromARGB(255, 188, 39, 207),
                    label: const Text(
                      'PRACTICA\n ESPIRITUAL',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color.fromARGB(255, 211, 228, 208),
                      ),
                    ),
                  ),
                ),
                Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black87,
                            spreadRadius: -1.0,
                            blurRadius: 13.0,
                          ),
                        ]),
                    margin: const EdgeInsets.only(
                      top: 20.0,
                    ),
                    height: 100,
                    width: 300,
                    child: FloatingActionButton.extended(
                      heroTag: "programa",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MiPracticaPrograma()),
                        );
                      },
                      backgroundColor: const Color.fromARGB(255, 40, 73, 221),
                      label: const Text(
                        'PASOS DE\n MANTENIMIENTO',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color.fromARGB(255, 211, 228, 208),
                        ),
                      ),
                    )),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black87,
                          spreadRadius: -1.0,
                          blurRadius: 13.0,
                        ),
                      ]),
                  margin: const EdgeInsets.only(
                    top: 20.0,
                  ),
                  height: 100,
                  width: 300,
                  child: FloatingActionButton.extended(
                    heroTag: "asistencia",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MiAsistenciaGrupo()),
                      );
                    },
                    backgroundColor: const Color.fromARGB(255, 248, 75, 53),
                    label: const Text(
                      'ASISTENCIA AL GRUPO\n Y SERVICIOS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color.fromARGB(255, 211, 228, 208),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }

  //* Metodo para abril un URL con Instrucciones
  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse('https://www.youtube.com/'))) {
      throw Exception('No se Puede abrir las instrucciones');
    }
  }
}

//* Widget para llegar al pensamiento del dia
class PensamientoDia extends StatelessWidget {
  PensamientoDia({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 100,
      width: 300,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black87,
              spreadRadius: -1.0,
              blurRadius: 13.0,
            ),
          ]),
      child: FloatingActionButton.extended(
        heroTag: "pensamiento",
        onPressed: _launchUrl,
        backgroundColor: const Color.fromARGB(255, 241, 161, 12),
        label: const Text(
          'PENSAMIENTO\n DEL DIA',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15.0,
            color: Color.fromARGB(255, 211, 228, 208),
          ),
        ),
      ),
    );
  }

  //* Url para el pensamiento del dia
  final Uri _url = Uri.parse('https://www.aa.org/es/daily-reflections');

  //* Metodo para abril un URL
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('No se Puede abrir $_url');
    }
  }
}
