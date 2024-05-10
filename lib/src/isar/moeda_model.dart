import 'package:isar/isar.dart';
part 'moeda_model.g.dart';

@collection
class MoedaModel {
  Id id = Isar.autoIncrement;
  late String? code; //O código da moeda de comparaçao
  late String? codein; // O código da moeda de entrada.
  late String? name; // O nome da moeda.
  late String? high; // O valor mais alto que a moeda atingiu.
  late String? low; // O valor mais baixo que a moeda atingiu.
  late String? varBid; //A variação do lance da moeda.
  late String? pctChange; //A porcentagem de variação do valor da moeda.
  late String? bid; //O valor atual de compra da moeda.
  late String? ask; //O valor atual de venda da moeda.
  late String? timestamp; //data/hora da últ atualização dos dados da moeda.
  late String? createDate; //A data de criação dos dados da moeda.



  MoedaModel({
    this.code,
    this.codein,
    this.name,
    this.high,
    this.low,
    this.varBid,
    this.pctChange,
    this.bid,
    this.ask,
    this.timestamp,
    this.createDate,
  });

  factory MoedaModel.fromMap(Map<String, dynamic> map) {
    return MoedaModel(
      code: map['code'],
      codein: map['codein'],
      name: map['name'],
      high: map['high'],
      low: map['low'],
      varBid: map['varBid'],
      pctChange: map['pctChange'],
      bid: map['bid'],
      ask: map['ask'],
      timestamp: map['timestamp'],
      createDate: map['create_date'],
    );
  }
}
