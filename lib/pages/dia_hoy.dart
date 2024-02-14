import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class DiaHoy extends StatelessWidget {
  const DiaHoy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //* variable tiempo presente
    var dt = DateTime.now();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 10.0),
            child: const Text('Solo por Hoy',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 228, 208),
                  fontSize: 15.0,
                )),
          ),
          Text(
              formatDate(dt, [d, ' de ', MM],
                  locale: const SpanishDateLocale()),
              style: const TextStyle(
                  color: Color.fromARGB(255, 211, 228, 208), fontSize: 15.0)),
        ],
      ),
    );
  }
}
