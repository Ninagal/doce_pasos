// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'banco_espiritual.dart';
import 'homewidget.dart';
import 'monitor_emociones.dart';
import 'sobriometro.dart';

class MiPracticaEspiritual extends StatelessWidget {
  const MiPracticaEspiritual({super.key});

  @override
  Widget build(BuildContext context) {
    return const PracticaEspiritual();
  }
}

class PracticaEspiritual extends StatefulWidget {
  const PracticaEspiritual({super.key});
  @override
  State<PracticaEspiritual> createState() => _PracticaEspiritualState();
}

class _PracticaEspiritualState extends State<PracticaEspiritual> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //* linea abajo de titulo
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(15.0),
            child: Container(
              height: 5.0,
              color: Colors.black87,
            )),
        title: const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              'Practica Espiritual',
            )),
        actions: const <Widget>[MiCasa()],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Container(
              height: 100.0,
              width: 300,
              child: FloatingActionButton.extended(
                backgroundColor: const Color.fromARGB(255, 241, 161, 12),
                foregroundColor: Colors.black,
                heroTag: "banco_espiritual",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MiBancoEspiritual()),
                  );
                },
                icon: const Icon(Icons.volunteer_activism,
                    color: Colors.white, size: 15.0),
                label: const Text(
                  'BANCO ESPIRITUAL',
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              height: 100.0,
              width: 300,
              child: FloatingActionButton.extended(
                backgroundColor: const Color.fromARGB(255, 248, 75, 53),
                foregroundColor: Colors.black,
                heroTag: "monitor_emociones",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MiMonitorEmociones()),
                  );
                },
                icon: const Icon(Icons.monitor_heart,
                    color: Colors.white, size: 15.0),
                label: const Text(
                  'MONITOR\n DE ACTITUDES',
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              height: 100.0,
              width: 300,
              child: FloatingActionButton.extended(
                backgroundColor: const Color.fromARGB(255, 40, 73, 221),
                foregroundColor: Colors.black,
                heroTag: "sobriometro",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MiSobriometro()),
                  );
                },
                icon:
                    const Icon(Icons.balance, color: Colors.white, size: 15.0),
                label: const Text(
                  'SOBRIOMETRO',
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                ),
              ),
            ),
            const SizedBox(height: 100),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: const Text(
                'NOTA: Los contadores de banco espiritual y monitor de emociones se resetean a principio de año',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10),
              ),
            )
          ],
        ),
      ),
    );
  }
}
