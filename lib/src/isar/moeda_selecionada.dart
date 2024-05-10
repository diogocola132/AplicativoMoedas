import 'package:isar/isar.dart';
part 'moeda_selecionada.g.dart';

@Collection()
class MoedaSelecionada {
  Id id = Isar.autoIncrement;
  late String siglass;
}
