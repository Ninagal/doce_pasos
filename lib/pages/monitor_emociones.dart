// ignore_for_file: sized_box_for_whitespace

import 'package:doce_pasos/data/database.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'homewidget.dart';

class MiMonitorEmociones extends StatelessWidget {
  const MiMonitorEmociones({super.key});

  @override
  Widget build(BuildContext context) {
    return const MonitorEmociones();
  }
}

class MonitorEmociones extends StatefulWidget {
  const MonitorEmociones({super.key});
  @override
  State<MonitorEmociones> createState() => _MonitorEmocionesState();
}

class _MonitorEmocionesState extends State<MonitorEmociones> {
  @override
  void initState() {
    if (_savedyearbox.get("SAVEDYEAR") == null) {
      dbsavedyear.createInitialsavedyear();
    } else {
      dbsavedyear.loadsavedyear();
    }
    if (_emocionesbox.get("EMOCIONES") == null) {
      dbemociones.createInitialemociones();
    } else if (DateTime.now().year != dbsavedyear.savedyear[0]) {
      dbemociones.loademociones();
      setState(() {
        dbemociones.emociones[0][2] = 0;
        dbemociones.emociones[1][2] = 0;
        dbemociones.emociones[2][2] = 0;
        dbemociones.emociones[3][2] = 0;
        dbemociones.emociones[4][2] = 0;
        dbemociones.emociones[5][2] = 0;
        dbemociones.emociones[6][2] = 0;
        dbemociones.emociones[7][2] = 0;
        dbemociones.emociones[8][2] = 0;
        dbemociones.emociones[9][2] = 0;
        dbemociones.emociones[10][2] = 0;
        dbemociones.emociones[11][2] = 0;
        dbemociones.emociones[12][2] = 0;
        dbemociones.emociones[13][2] = 0;
        dbemociones.emociones[14][2] = 0;
        dbemociones.emociones[15][2] = 0;
        dbemociones.emociones[16][2] = 0;
        dbemociones.emociones[17][2] = 0;
        dbemociones.emociones[18][2] = 0;
        dbemociones.emociones[19][2] = 0;
        dbemociones.emociones[20][2] = 0;
        dbemociones.emociones[21][2] = 0;
        dbemociones.emociones[22][2] = 0;
        dbemociones.emociones[23][2] = 0;
        dbemociones.emociones[24][2] = 0;
        dbemociones.emociones[25][2] = 0;
      });
      dbemociones.updateemociones();
    } else {
      dbemociones.loademociones();
    }
    super.initState();
  }

  final _emocionesbox = Hive.box('emocionesbox');
  EmocionesDataBase dbemociones = EmocionesDataBase();

  final _savedyearbox = Hive.box('savedyearbox');
  SavedYearDataBase dbsavedyear = SavedYearDataBase();

  //* funcion para incrementar emociones dentro del dialogo de emociones
  void _incrementemocionesCounter(int index) {
    setState(() {
      dbemociones.emociones[index][2]++;
      Navigator.of(context).pop();
    });
    dbemociones.updateemociones();
  }

  void _savedyear() {
    setState(() {
      dbsavedyear.savedyear[0] = DateTime.now().year;
    });
    dbsavedyear.updatesavedyear();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text('Monitor de Actitudes')),
          actions: const <Widget>[MiCasa()],
          bottom: const TabBar(
            indicatorWeight: 4.0,
            tabs: <Widget>[
              Tab(
                text: 'Resumen',
              ),
              Tab(
                text: 'Actitudes',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            emocionesresumenmethod(),
            emocionesmethod(),
          ],
        ),
      ),
    );
  }

  Center emocionesresumenmethod() {
    return Center(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100,
              childAspectRatio: .7,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5),
          itemCount: dbemociones.emociones.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              height: 300.0,
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: -2.0,
                      blurRadius: 7.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(5)),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dbemociones.emociones[index][2].toString(),
                      style: const TextStyle(fontSize: 17.0),
                      textAlign: TextAlign.center,
                    ),
                    Image.asset(
                      'assets/images/iconos/emociones/${dbemociones.emociones[index][1]}',
                      scale: 5,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Center emocionesmethod() {
    return Center(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: .7,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5),
          itemCount: dbemociones.emociones.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              height: 300.0,
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: -2.0,
                      blurRadius: 7.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(5)),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dbemociones.emociones[index][0],
                      style: const TextStyle(fontSize: 15.0),
                      textAlign: TextAlign.center,
                    ),
                    Image.asset(
                      'assets/images/iconos/emociones/${dbemociones.emociones[index][1]}',
                      scale: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${dbemociones.emociones[index][2]}',
                            style: const TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Container(
                            height: 45.0,
                            child: FloatingActionButton(
                              heroTag: null,
                              onPressed: () {
                                _savedyear();
                                alertaemociones(index);
                              },
                              backgroundColor:
                                  const Color.fromARGB(255, 241, 161, 12),
                              child: const Icon(
                                Icons.add,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  //* dialogo para sumar emociones
  Future alertaemociones(int index) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
          alignment: Alignment.topCenter,
          backgroundColor: const Color.fromARGB(255, 236, 232, 164),
          shadowColor: Colors.black38,
          content: Container(
            padding: const EdgeInsets.all(8.0),
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Confirma que vas a Sumar ${dbemociones.emociones[index][0]}',
                  style: const TextStyle(fontSize: 15.0),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Container(
                  width: 200,
                  child: FloatingActionButton(
                    onPressed: () => _incrementemocionesCounter(index),
                    backgroundColor: const Color.fromARGB(255, 241, 161, 12),
                    child: const Text(
                      'CONFIRMAR',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                ),
              ],
            ),
          )));
}
