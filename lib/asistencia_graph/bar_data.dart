import 'package:doce_pasos/asistencia_graph/individual_bar.dart';

class BarDataAsistencia {
  final double enerosuma;
  final double febrerosuma;
  final double marzosuma;
  final double abrilsuma;
  final double mayosuma;
  final double juniosuma;
  final double juliosuma;
  final double agostosuma;
  final double septiembresuma;
  final double octubresuma;
  final double noviembresuma;
  final double diciembresuma;

  BarDataAsistencia({
    required this.enerosuma,
    required this.febrerosuma,
    required this.marzosuma,
    required this.abrilsuma,
    required this.mayosuma,
    required this.juniosuma,
    required this.juliosuma,
    required this.agostosuma,
    required this.septiembresuma,
    required this.octubresuma,
    required this.noviembresuma,
    required this.diciembresuma,
  });

  List<IndividualBarAsistencia> barDataAsistencia = [];

  void initializeBarDataAsistencia() {
    barDataAsistencia = [
      IndividualBarAsistencia(x: 0, y: enerosuma),
      IndividualBarAsistencia(x: 1, y: febrerosuma),
      IndividualBarAsistencia(x: 2, y: marzosuma),
      IndividualBarAsistencia(x: 3, y: abrilsuma),
      IndividualBarAsistencia(x: 4, y: mayosuma),
      IndividualBarAsistencia(x: 5, y: juniosuma),
      IndividualBarAsistencia(x: 6, y: juliosuma),
      IndividualBarAsistencia(x: 7, y: agostosuma),
      IndividualBarAsistencia(x: 8, y: septiembresuma),
      IndividualBarAsistencia(x: 9, y: octubresuma),
      IndividualBarAsistencia(x: 10, y: noviembresuma),
      IndividualBarAsistencia(x: 11, y: diciembresuma),
    ];
  }
}
