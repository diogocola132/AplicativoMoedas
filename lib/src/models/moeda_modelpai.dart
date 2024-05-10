import 'package:flutter_graficonovo/src/isar/moeda_model.dart';

class MoedaModelPai {
  List<MoedaModel> moedas;

  String? nome;
  String? valor;
  String? data;

  MoedaModelPai({
    required this.moedas,
    this.data,
    this.nome,
    this.valor,
  });
}
