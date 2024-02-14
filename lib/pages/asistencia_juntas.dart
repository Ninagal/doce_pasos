import 'package:date_format/date_format.dart';
import 'package:doce_pasos/data/database.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../actividades_graph/bar_actividades.dart';
import '../asistencia_graph/bar_asistencia.dart';
import 'homewidget.dart';

class MiAsistenciaGrupo extends StatelessWidget {
  const MiAsistenciaGrupo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MiAsistencia();
  }
}

class MiAsistencia extends StatefulWidget {
  const MiAsistencia({super.key});
  @override
  State<MiAsistencia> createState() => _MiAsistenciaState();
}

class _MiAsistenciaState extends State<MiAsistencia>
    with TickerProviderStateMixin {
  int _diaasistencia = 0;
  late TabController _tabController;
  late TabController _nestedTabController;

  @override
  void initState() {
    if (_savedyearbox.get("SAVEDYEAR") == null) {
      dbsavedyear.createInitialsavedyear();
    } else {
      dbsavedyear.loadsavedyear();
    }

    if (_actividadesbox.get("ACTIVIDADES") == null) {
      dbactividades.createInitialactividades();
    } else {
      dbactividades.loadactividades();
    }
    if (_serviciosbox.get("SERVICIOS") == null) {
      dbservicios.createInitialservicios();
    } else {
      dbservicios.loadservicios();
    }
    if (_asistenciabox.get("ASISTENCIA") == null) {
      dbasistencia.createInitialasistencia();
    } else if (DateTime.now().year != dbsavedyear.savedyear[0]) {
      dbasistencia.loadasistencia();
      setState(() {
        dbasistencia.asistencia[0][1] = 0;
        dbasistencia.asistencia[1][1] = 0;
        dbasistencia.asistencia[2][1] = 0;
        dbasistencia.asistencia[3][1] = 0;
        dbasistencia.asistencia[4][1] = 0;
        dbasistencia.asistencia[5][1] = 0;
        dbasistencia.asistencia[6][1] = 0;
        dbasistencia.asistencia[7][1] = 0;
        dbasistencia.asistencia[8][1] = 0;
        dbasistencia.asistencia[9][1] = 0;
        dbasistencia.asistencia[10][1] = 0;
        dbasistencia.asistencia[11][1] = 0;
      });
      dbasistencia.updateasistencia();
    } else {
      dbasistencia.loadasistencia();
    }
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _nestedTabController = TabController(length: 2, vsync: this);
    _loadDiaAsistencia();
  }

  final _actividadesbox = Hive.box('actividadesbox');
  ActividadesDataBase dbactividades = ActividadesDataBase();

  final _serviciosbox = Hive.box('serviciosbox');
  ServiciosDataBase dbservicios = ServiciosDataBase();

  final _asistenciabox = Hive.box('asistenciabox');
  AsistenciaDataBase dbasistencia = AsistenciaDataBase();

  final _savedyearbox = Hive.box('savedyearbox');
  SavedYearDataBase dbsavedyear = SavedYearDataBase();

  void _loadDiaAsistencia() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _diaasistencia = prefs.getInt('diaasistencia') ?? 0;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _nestedTabController.dispose();
  }

  //* funcion para incrementar actividades dentro del dialogo de actividades
  void _incrementActividadesCounter(int index) {
    setState(() {
      dbactividades.actividades[index][2]++;
      Navigator.pop(context);
    });
    dbactividades.updateactividades();
    _nestedTabController.index = 1;
  }

  void asistencia() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => prefs.setInt('diaasistencia', DateTime.now().day));
  }

  //* funcion para incrementar asistencia dentro del dialogo de asistencia
  void _incrementAsistenciaCounter(int index) async {
    setState(() {
      dbasistencia.asistencia[index][1]++;
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => super.widget));
    });
    dbasistencia.updateasistencia();
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
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text('Asistencia y Servicios')),
          actions: const <Widget>[MiCasa()],
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabAlignment: TabAlignment.center,
            indicatorWeight: 4.0,
            tabs: const <Widget>[
              Tab(
                text: 'ASISTENCIA',
              ),
              Tab(
                text: 'ACTIVIDADES',
              ),
              Tab(
                text: 'SERVICIOS',
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            asistenciamethod(),
            actividadesmethod(),
            serviciosmethod(),
          ],
        ),
      ),
    );
  }

  asistenciamethod() {
    return SingleChildScrollView(
      child: Column(children: [
        const SizedBox(
          height: 10,
        ),
        Text(
            formatDate(DateTime.now(), [d, ' de ', MM],
                locale: const SpanishDateLocale()),
            style: const TextStyle(fontSize: 17.0)),
        const SizedBox(
          height: 10,
        ),
        if (DateTime.now().month == 1)
          SizedBox(
            height: 80,
            child: FloatingActionButton.extended(
              backgroundColor: const Color.fromARGB(255, 241, 161, 12),
              onPressed: () {
                if (_diaasistencia == DateTime.now().day) {
                  alertaconcluida(0);
                } else {
                  alertaasistencia(0);
                }
              },
              label: const Text(
                'Marca tu Asistencia',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        if (DateTime.now().month == 2)
          SizedBox(
            height: 80,
            child: FloatingActionButton.extended(
              backgroundColor: const Color.fromARGB(255, 241, 161, 12),
              onPressed: () {
                if (_diaasistencia == DateTime.now().day) {
                  alertaconcluida(1);
                } else {
                  alertaasistencia(1);
                }
              },
              label: const Text(
                'Marca tu Asistencia',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        if (DateTime.now().month == 3)
          SizedBox(
            height: 80,
            child: FloatingActionButton.extended(
              backgroundColor: const Color.fromARGB(255, 241, 161, 12),
              onPressed: () {
                if (_diaasistencia == DateTime.now().day) {
                  alertaconcluida(2);
                } else {
                  alertaasistencia(2);
                }
              },
              label: const Text(
                'Marca tu Asistencia',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        if (DateTime.now().month == 4)
          SizedBox(
            height: 80,
            child: FloatingActionButton.extended(
              backgroundColor: const Color.fromARGB(255, 241, 161, 12),
              onPressed: () {
                if (_diaasistencia == DateTime.now().day) {
                  alertaconcluida(3);
                } else {
                  alertaasistencia(3);
                }
              },
              label: const Text(
                'Marca tu Asistencia',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        if (DateTime.now().month == 5)
          SizedBox(
            height: 80,
            child: FloatingActionButton.extended(
              backgroundColor: const Color.fromARGB(255, 241, 161, 12),
              onPressed: () {
                if (_diaasistencia == DateTime.now().day) {
                  alertaconcluida(4);
                } else {
                  alertaasistencia(4);
                }
              },
              label: const Text(
                'Marca tu Asistencia',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        if (DateTime.now().month == 6)
          SizedBox(
            height: 80,
            child: FloatingActionButton.extended(
              backgroundColor: const Color.fromARGB(255, 241, 161, 12),
              onPressed: () {
                if (_diaasistencia == DateTime.now().day) {
                  alertaconcluida(5);
                } else {
                  alertaasistencia(5);
                }
              },
              label: const Text(
                'Marca tu Asistencia',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        if (DateTime.now().month == 7)
          SizedBox(
            height: 80,
            child: FloatingActionButton.extended(
              backgroundColor: const Color.fromARGB(255, 241, 161, 12),
              onPressed: () {
                if (_diaasistencia == DateTime.now().day) {
                  alertaconcluida(6);
                } else {
                  alertaasistencia(6);
                }
              },
              label: const Text(
                'Marca tu Asistencia',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        if (DateTime.now().month == 8)
          SizedBox(
            height: 80,
            child: FloatingActionButton.extended(
              backgroundColor: const Color.fromARGB(255, 241, 161, 12),
              onPressed: () {
                if (_diaasistencia == DateTime.now().day) {
                  alertaconcluida(7);
                } else {
                  alertaasistencia(7);
                }
              },
              label: const Text(
                'Marca tu Asistencia',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        if (DateTime.now().month == 9)
          FloatingActionButton(
            onPressed: () {
              if (_diaasistencia == DateTime.now().day) {
                alertaconcluida(8);
              } else {
                alertaasistencia(8);
              }
            },
          ),
        if (DateTime.now().month == 10)
          SizedBox(
            height: 80,
            child: FloatingActionButton.extended(
              backgroundColor: const Color.fromARGB(255, 241, 161, 12),
              onPressed: () {
                if (_diaasistencia == DateTime.now().day) {
                  alertaconcluida(9);
                } else {
                  alertaasistencia(9);
                }
              },
              label: const Text(
                'Marca tu Asistencia',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        if (DateTime.now().month == 11)
          SizedBox(
            height: 80,
            child: FloatingActionButton.extended(
              backgroundColor: const Color.fromARGB(255, 241, 161, 12),
              onPressed: () {
                if (_diaasistencia == DateTime.now().day) {
                  alertaconcluida(10);
                } else {
                  alertaasistencia(10);
                }
              },
              label: const Text(
                'Marca tu Asistencia',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        if (DateTime.now().month == 12)
          SizedBox(
            height: 80,
            child: FloatingActionButton.extended(
              backgroundColor: const Color.fromARGB(255, 241, 161, 12),
              onPressed: () {
                if (_diaasistencia == DateTime.now().day) {
                  alertaconcluida(11);
                } else {
                  alertaasistencia(11);
                }
              },
              label: const Text(
                'Marca tu Asistencia',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        const SizedBox(
          height: 25,
        ),
        const Text('TU ASISTENCIA EN EL AÑO', style: TextStyle(fontSize: 15.0)),
        const AsistenciaChart()
      ]),
    );
  }

  Future alertaasistencia(int index) => showDialog(
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
                  formatDate(DateTime.now(),
                      ['Marcar Asistencia para \n', d, ' de ', MM],
                      locale: const SpanishDateLocale()),
                  style: const TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                SizedBox(
                  width: 200,
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      _savedyear();
                      _incrementAsistenciaCounter(index);
                      asistencia();
                    },
                    backgroundColor: const Color.fromARGB(255, 241, 161, 12),
                    label: const Text(
                      'CONFIRMAR',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          )));

  Future alertaconcluida(int index) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
          alignment: Alignment.topCenter,
          backgroundColor: const Color.fromARGB(255, 236, 232, 164),
          shadowColor: Colors.black38,
          content: Container(
            padding: const EdgeInsets.all(8.0),
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  formatDate(
                      DateTime.now(),
                      [
                        'Ya haz Marcado\n Asistencia para\n',
                        d,
                        ' de ',
                        MM,
                        '\n ¿Quieres Marcar un\n Dia Mas?'
                      ],
                      locale: const SpanishDateLocale()),
                  style: const TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 80,
                      child: FloatingActionButton(
                        onPressed: () {
                          _incrementAsistenciaCounter(index);
                        },
                        backgroundColor:
                            const Color.fromARGB(255, 241, 161, 12),
                        child: const Text('EXTRA',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15)),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 100,
                      height: 80,
                      child: FloatingActionButton(
                        onPressed: () => Navigator.of(context).pop(),
                        backgroundColor:
                            const Color.fromARGB(255, 241, 161, 12),
                        child: const Text('NO', style: TextStyle(fontSize: 15)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )));

  actividadesmethod() {
    return Column(children: [
      Container(
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 40, 73, 221)),
        child: TabBar(
          controller: _nestedTabController,
          indicator: BoxDecoration(
            color: const Color.fromARGB(255, 188, 39, 207),
            borderRadius: BorderRadius.circular(20),
          ),
          labelColor: Colors.white70,
          dividerColor: Colors.white70,
          // ignore: prefer_const_literals_to_create_immutables
          tabs: const <Widget>[
            Tab(
              text: 'ACTIVIDAD',
            ),
            Tab(
              text: 'GRAFICO',
            ),
          ],
        ),
      ),
      Expanded(
        child: TabBarView(
          controller: _nestedTabController,
          children: <Widget>[
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 3),
                  width: double.infinity,
                  color: const Color.fromARGB(255, 241, 161, 12),
                  height: 40,
                  child: const Text(
                    '¿Qué Actividad Haz Hecho?',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: double.infinity,
                    child: Center(
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: .7,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5),
                          itemCount: dbactividades.actividades.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return Container(
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
                                      dbactividades.actividades[index][0],
                                      style: const TextStyle(fontSize: 15.0),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Image.asset(
                                      'assets/images/iconos/actividades/${dbactividades.actividades[index][1]}',
                                      scale: 5,
                                    ),
                                    FloatingActionButton(
                                      heroTag: null,
                                      onPressed: () {
                                        alertaactividades(index);
                                      },
                                      backgroundColor: const Color.fromARGB(
                                          255, 241, 161, 12),
                                      child: const Icon(
                                        Icons.add,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 5.0),
              width: double.infinity,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        'GRAFICO DE ACTIVIDADES REALIZADAS',
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    ActividadesChart(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  Future alertaactividades(int index) => showDialog(
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
                  'Confirma que vas a Sumar ${dbactividades.actividades[index][0]}',
                  style: const TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  width: 200,
                  child: FloatingActionButton.extended(
                    heroTag: 'incrementaactividad',
                    onPressed: () {
                      _incrementActividadesCounter(index);
                    },
                    backgroundColor: const Color.fromARGB(255, 241, 161, 12),
                    label: const Text(
                      'CONFIRMAR',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                ),
              ],
            ),
          )));

  serviciosmethod() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 3),
          width: double.infinity,
          color: const Color.fromARGB(255, 241, 161, 12),
          height: 30,
          child: const Text(
            'Mis Servicios',
            style: TextStyle(fontSize: 15, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 5),
          height: 200,
          color: const Color.fromARGB(255, 241, 161, 12),
          width: double.infinity,
          child: Center(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 100,
                    childAspectRatio: 1,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8),
                scrollDirection: Axis.horizontal,
                itemCount: dbservicios.servicios.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                    padding: const EdgeInsets.all(2.0),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (dbservicios.servicios[index][2] == true)
                          SizedBox(
                            height: 160,
                            child: Image.asset(
                              'assets/images/iconos/servicios/${dbservicios.servicios[index][1]}',
                              scale: 3,
                            ),
                          ),
                      ],
                    ),
                  );
                }),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 3),
          width: double.infinity,
          color: const Color.fromARGB(255, 241, 161, 12),
          height: 30,
          child: const Text(
            '¿Qué Servicio Haz Hecho?',
            style: TextStyle(fontSize: 15, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: SizedBox(
            height: double.infinity,
            child: Center(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: .7,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemCount: dbservicios.servicios.length,
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
                              dbservicios.servicios[index][0],
                              style: const TextStyle(fontSize: 15.0),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Image.asset(
                              'assets/images/iconos/servicios/${dbservicios.servicios[index][1]}',
                              scale: 5,
                            ),
                            Transform.scale(
                              scale: 2,
                              child: Checkbox(
                                value: dbservicios.servicios[index][2],
                                onChanged: (bool? value) {
                                  // This is where we update the state when the checkbox is tapped
                                  setState(() {
                                    dbservicios.servicios[index][2] = value!;
                                  });
                                  dbservicios.updateservicios();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ),
      ],
    );
  }
}
