import 'package:flutter/material.dart';
import 'package:flutter_graficonovo/src/isar/moeda_selecionada.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

// CRUD
class MoedaDatabase extends ChangeNotifier {
  static late Isar isar;

  // Initialize
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [MoedaSelecionadaSchema],
      directory: dir.path,
    );
  }

  // Lista de MoedaModel
  final List<MoedaSelecionada> currentMoedaSelecionada = [];

// Create
  Future<void> addMoedaSelecionada(String siglass) async {
    // Cria um novo objeto moeda
    final newMoedaSelecionada = MoedaSelecionada()..siglass = siglass;

    // Salvar no DB
    await isar.writeTxn(() => isar.moedaSelecionadas.put(newMoedaSelecionada));
    // Re-read from DB
    await fetchNotes();
  }

  // Read
  Future<void> fetchNotes() async {
    List<MoedaSelecionada> fetchedNotes =
        await isar.moedaSelecionadas.where().findAll();
    currentMoedaSelecionada.clear();
    currentMoedaSelecionada.addAll(fetchedNotes);
    notifyListeners();
  }

  // Update
  Future<void> updateMoedaSelecionada(int id, String newValue) async {
    final existingNote = await isar.moedaSelecionadas.get(id);
    if (existingNote != null) {
      existingNote.siglass = newValue;
      await isar.writeTxn(() => isar.moedaSelecionadas.put(existingNote));
      await fetchNotes();
    }
  }

  // Delete
  Future<void> deleteMoedaSelecionada(int id) async {
    await isar.writeTxn(() => isar.moedaSelecionadas.delete(id));
    await fetchNotes();
  }
}
