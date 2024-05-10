import 'dart:convert';
import 'package:flutter_graficonovo/src/http/exceptions.dart';
import 'package:flutter_graficonovo/src/http/http_client.dart';
import 'package:flutter_graficonovo/src/models/moeda_modelpai.dart';
import 'package:flutter_graficonovo/src/isar/moeda_model.dart';

abstract class IMoedaRepository {
  Future<MoedaModelPai> getMoedas($startDate, $endDate, $moeda);
}

class MoedaRepository implements IMoedaRepository {
  final IhttpClient client;

  MoedaRepository({required this.client});

  @override
  Future<MoedaModelPai> getMoedas(startDate, endDate, moeda) async {
    final url = Uri.https(
      'economia.awesomeapi.com.br',
      '/$moeda/10',
      {'start_date': startDate, 'end_date': endDate},
    );

    final response = await client.get(url: url.toString());

    if (response.statusCode == 200) {
      final List<MoedaModel> moedas = [];

      final body = jsonDecode(response.body);

      (body as List).map((item) {
        final MoedaModel moeda = MoedaModel.fromMap(item);
        moedas.add(moeda);
      }).toList();

      MoedaModel first = moedas.first;
      final MoedaModelPai pai = MoedaModelPai(
        moedas: moedas,
        nome: first.name,
        valor: first.bid,
        data: first.createDate,
      );

      return pai;
    } else if (response.statusCode == 404) {
      throw NotFoundException(message: 'A url informada nao é valida');
    } else {
      throw Exception('Nao foi possivel carregar as moedas');
    }
  }
}
