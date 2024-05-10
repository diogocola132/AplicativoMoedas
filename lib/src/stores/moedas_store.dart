import 'package:flutter/material.dart';
import 'package:flutter_graficonovo/src/http/exceptions.dart';

import 'package:flutter_graficonovo/src/models/moeda_modelpai.dart';
import 'package:flutter_graficonovo/src/repositories/moeda_repository.dart';

//usada para gerenciar o estado da tela
class MoedaStore {
  final IMoedaRepository repository;

  // Variavel reativa para o loading
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  // Variavel reativa para o state
  final ValueNotifier<List<MoedaModelPai>> state =
      ValueNotifier<List<MoedaModelPai>>([]);

  // Variavel reativa para o erro
  final ValueNotifier<String> erro = ValueNotifier<String>('');

  MoedaStore({required this.repository});

  Future getMoedas(String moeda) async {
    isLoading.value = true;

    try {
      final result = await repository.getMoedas('20240416', '20240423', moeda);
      state.value = [result];
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    }
    isLoading.value = false;
  }
}
