import 'package:doce_pasos/data/database.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'practica_programa.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainDrawerResultado();
  }
}

class MainDrawerResultado extends StatefulWidget {
  const MainDrawerResultado({super.key});
  @override
  State<MainDrawerResultado> createState() => _MainDrawerResultadoState();
}

class _MainDrawerResultadoState extends State<MainDrawerResultado> {
  @override
  void initState() {
    if (_saveddatebox.get("SAVEDDATE") == null) {
      dbsaveddate.createInitialsaveddate();
    } else {
      dbsaveddate.loadsaveddate();
    }

    if (_paso10box.get("PASO10") == null) {
      dbpaso10.createInitialpaso10();
    } else if (DateTime.now().day != dbsaveddate.saveddate[0]) {
      dbpaso10.loadpaso10();
      setState(() {
        dbpaso10.paso10[0][2] = false;
        dbpaso10.paso10[1][2] = false;
        dbpaso10.paso10[2][2] = false;
      });
      dbpaso10.updatepaso10();
    } else {
      dbpaso10.loadpaso10();
    }
    if (_paso11box.get("PASO11") == null) {
      dbpaso11.createInitialpaso11();
    } else if (DateTime.now().day != dbsaveddate.saveddate[0]) {
      dbpaso11.loadpaso11();
      setState(() {
        dbpaso11.paso11[0][2] = false;
        dbpaso11.paso11[1][2] = false;
        dbpaso11.paso11[2][2] = false;
        dbpaso11.paso11[3][2] = false;
        dbpaso11.paso11[4][2] = false;
        dbpaso11.paso11[5][2] = false;
        dbpaso11.paso11[6][2] = false;
        dbpaso11.paso11[7][2] = false;
        dbpaso11.paso11[8][2] = false;
        dbpaso11.paso11[9][2] = false;
        dbpaso11.paso11[10][2] = false;
        dbpaso11.paso11[11][2] = false;
        dbpaso11.paso11[12][2] = false;
      });
      dbpaso11.updatepaso11();
    } else {
      dbpaso11.loadpaso11();
    }
    if (_silenciobox.get("SILENCIO") == null) {
      dbsilencio.createInitialsilencio();
    } else if (DateTime.now().day != dbsaveddate.saveddate[0]) {
      dbsilencio.loadsilencio();
      setState(() {
        dbsilencio.silencio[0][2] = false;
        dbsilencio.silencio[1][2] = false;
        dbsilencio.silencio[2][2] = false;
        dbsilencio.silencio[3][2] = false;
      });
      dbsilencio.updatesilencio();
    } else {
      dbsilencio.loadsilencio();
    }
    if (_paso12box.get("PASO12") == null) {
      dbpaso12.createInitialpaso12();
    } else {
      dbpaso12.loadpaso12();
    }
    super.initState();
  }

  final _saveddatebox = Hive.box('saveddatebox');
  SavedDateDataBase dbsaveddate = SavedDateDataBase();

  final _paso10box = Hive.box('paso10box');
  Paso10DataBase dbpaso10 = Paso10DataBase();

  final _paso11box = Hive.box('paso11box');
  Paso11DataBase dbpaso11 = Paso11DataBase();

  final _silenciobox = Hive.box('silenciobox');
  SilencioDataBase dbsilencio = SilencioDataBase();

  final _paso12box = Hive.box('paso12box');
  Paso12DataBase dbpaso12 = Paso12DataBase();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
            color: const Color.fromARGB(255, 235, 210, 164),
            child: ListView(
              children: [
                const SizedBox(
                  height: 230,
                  child: DrawerHeader(
                      child: Column(
                    children: [
                      Icon(
                        Icons.self_improvement,
                        size: 160,
                        color: Color.fromARGB(255, 248, 75, 53),
                      ),
                      Text(
                        'Práctica del Programa HOY',
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      )
                    ],
                  )),
                ),
                const SizedBox(
                  height: 15,
                ),
                if (dbpaso10.paso10[0][2] == true &&
                    dbpaso10.paso10[1][2] == true &&
                    dbpaso10.paso10[2][2] == true)
                  const ListTile(
                    trailing: Icon(
                      Icons.check_box,
                      size: 20,
                    ),
                    title: Text('PASO 10', style: TextStyle(fontSize: 14)),
                  )
                else
                  const ListTile(
                    trailing: Icon(
                      Icons.check_box_outline_blank,
                      size: 20,
                    ),
                    title: Text(
                      'PASO 10',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                if (dbsilencio.silencio[0][2] == true ||
                    dbsilencio.silencio[1][2] == true ||
                    dbsilencio.silencio[2][2] == true ||
                    dbsilencio.silencio[3][2] == true)
                  const ListTile(
                    trailing: Icon(
                      Icons.check_box,
                      size: 20,
                    ),
                    title: Text('MOMENTO DE SILENCIO',
                        style: TextStyle(fontSize: 14)),
                  )
                else
                  const ListTile(
                    trailing: Icon(
                      Icons.check_box_outline_blank,
                      size: 20,
                    ),
                    title: Text(
                      'MOMENTO DE SILENCIO',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                if (dbpaso11.paso11[0][2] == true ||
                    dbpaso11.paso11[1][2] == true ||
                    dbpaso11.paso11[2][2] == true ||
                    dbpaso11.paso11[3][2] == true ||
                    dbpaso11.paso11[4][2] == true ||
                    dbpaso11.paso11[5][2] == true ||
                    dbpaso11.paso11[6][2] == true ||
                    dbpaso11.paso11[7][2] == true ||
                    dbpaso11.paso11[8][2] == true ||
                    dbpaso11.paso11[9][2] == true ||
                    dbpaso11.paso11[10][2] == true ||
                    dbpaso11.paso11[11][2] == true ||
                    dbpaso11.paso11[12][2] == true)
                  const ListTile(
                    trailing: Icon(
                      Icons.check_box,
                      size: 20,
                    ),
                    title: Text('MOMENTO DE ORACIÓN',
                        style: TextStyle(fontSize: 14)),
                  )
                else
                  const ListTile(
                    trailing: Icon(
                      Icons.check_box_outline_blank,
                      size: 20,
                    ),
                    title: Text(
                      'MOMENTO DE ORACIÓN',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                if (dbpaso12.paso12[0][2] == true ||
                    dbpaso12.paso12[1][2] == true ||
                    dbpaso12.paso12[2][2] == true ||
                    dbpaso12.paso12[3][2] == true ||
                    dbpaso12.paso12[4][2] == true ||
                    dbpaso12.paso12[5][2] == true ||
                    dbpaso12.paso12[6][2] == true ||
                    dbpaso12.paso12[7][2] == true)
                  const ListTile(
                    trailing: Icon(
                      Icons.check_box,
                      size: 20,
                    ),
                    title: Text('PASO 12', style: TextStyle(fontSize: 14)),
                  )
                else
                  const ListTile(
                    trailing: Icon(
                      Icons.check_box_outline_blank,
                      size: 20,
                    ),
                    title: Text(
                      'PASO 12',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                const SizedBox(
                  height: 30,
                ),
                ListTile(
                  title: const Text(
                    'IR AL PROGRAMA',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Color.fromARGB(255, 248, 75, 53)),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MiPracticaPrograma())),
                ),
              ],
            )));
  }
}
