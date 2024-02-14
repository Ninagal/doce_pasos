import 'package:doce_pasos/actividades_graph/individual_bar.dart';

class BarDataActividades {
  final double tribunasuma;
  final double literaturasuma;
  final double padrinosuma;
  final double septimosuma;
  final double serviciossuma;
  final double doceavosuma;
  final double testimoniosuma;

  BarDataActividades({
    required this.tribunasuma,
    required this.literaturasuma,
    required this.padrinosuma,
    required this.septimosuma,
    required this.serviciossuma,
    required this.doceavosuma,
    required this.testimoniosuma,
  });

  List<IndividualBarActividades> barDataActividades = [];

  void initializeBarDataActividades() {
    barDataActividades = [
      IndividualBarActividades(x: 0, y: tribunasuma),
      IndividualBarActividades(x: 1, y: literaturasuma),
      IndividualBarActividades(x: 2, y: padrinosuma),
      IndividualBarActividades(x: 3, y: septimosuma),
      IndividualBarActividades(x: 4, y: serviciossuma),
      IndividualBarActividades(x: 5, y: doceavosuma),
      IndividualBarActividades(x: 6, y: testimoniosuma),
    ];
  }
}
