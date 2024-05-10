import 'package:flutter/material.dart';
import 'package:flutter_graficonovo/src/http/http_client.dart';
import 'package:flutter_graficonovo/src/isar/moeda_database.dart';
import 'package:flutter_graficonovo/src/isar/moeda_selecionada.dart';
import 'package:flutter_graficonovo/src/models/colors_app.dart';
import 'package:flutter_graficonovo/src/models/moeda_static.dart';
import 'package:flutter_graficonovo/src/repositories/moeda_repository.dart';
import 'package:flutter_graficonovo/src/stores/moedas_store.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String m1 = '';
  String m2 = '';
  String moedaescolha = '';
  String selectm1 = '';
  String selectm2 = '';
  String nomedaescolha1 = '';
  String nomedaescolha2 = '';
  String nomedamoeda1 = '';
  String nomedamoeda2 = '';
  final textController = TextEditingController(); // update

  final MoedaStore store = MoedaStore(
    repository: MoedaRepository(
      client: HttpClient(),
    ),
  );

  @override
  void initState() {
    super.initState();
    readMoedaSelecionada();
  }

  void createMoedaSelecionada() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            height: 350,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 200,
                    child: Column(
                      children: [
                        const Text(
                          'Selecione a Primeira Moeda',
                          style: TextStyle(
                            color: AppColors.color2,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Autocomplete<String>(
                          optionsBuilder: (TextEditingValue textEditingValue) {
                            if (textEditingValue.text.isEmpty) {
                              return const Iterable<String>.empty();
                            }
                            var prefix = textEditingValue.text.toLowerCase();
                            return MoedaStatic.moedaStatic.where(
                              (Map<String, String> item) {
                                return item.values.any((String value) =>
                                    value.toLowerCase().startsWith(prefix));
                              },
                            ).expand(
                              (Map<String, String> item) => item.values.where(
                                (String value) =>
                                    value.toLowerCase().startsWith(prefix),
                              ),
                            );
                          },
                          onSelected: (String value) {
                            setState(() {
                              nomedamoeda1 = value;
                              for (var moeda in MoedaStatic.moedaStatic) {
                                if (moeda.containsValue(value)) {
                                  m1 = moeda.keys
                                      .firstWhere((key) => moeda[key] == value);
                                  selectm1 = m1;
                                  nomedaescolha1 = nomedamoeda1;
                                }
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const Text(
                        'Segunda Moeda ',
                        style: TextStyle(
                            color: AppColors.color2,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 200,
                        child: Autocomplete<String>(
                          optionsBuilder: (TextEditingValue textEditingValue) {
                            if (textEditingValue.text.isEmpty) {
                              return const Iterable<String>.empty();
                            }
                            var prefix = textEditingValue.text.toLowerCase();
                            return MoedaStatic.moedaStatic.where(
                              (Map<String, String> item) {
                                return item.values.any((String value) =>
                                    value.toLowerCase().startsWith(prefix));
                              },
                            ).expand(
                              (Map<String, String> item) => item.values.where(
                                (String value) =>
                                    value.toLowerCase().startsWith(prefix),
                              ),
                            );
                          },
                          onSelected: (String value) {
                            setState(
                              () {
                                nomedamoeda2 = value;
                                for (var moeda in MoedaStatic.moedaStatic) {
                                  if (moeda.containsValue(value)) {
                                    m2 = moeda.keys.firstWhere(
                                        (key) => moeda[key] == value);
                                    selectm2 = m2;
                                    nomedaescolha2 = nomedamoeda2;
                                  }
                                }
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 60),
                      IconButton(
                        color: AppColors.color2,
                        onPressed: () {
                          moedaescolha = '$nomedaescolha1/$nomedaescolha2';
                          Navigator.pop(context);
                          context
                              .read<MoedaDatabase>()
                              .addMoedaSelecionada('$m1-$m2');
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void readMoedaSelecionada() {
    context.read<MoedaDatabase>().fetchNotes();
  }

  void updateMoedaSelecionada(MoedaSelecionada moedaSelecionada) {
    textController.text = moedaSelecionada.siglass;
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text('atualizar moeda'),
            ));
  }

  void deleteMoedaSelecionada(int id) {
    context.read<MoedaDatabase>().deleteMoedaSelecionada(id);
  }

  @override
  Widget build(BuildContext context) {
    final moedaDatabase = context.watch<MoedaDatabase>();

    List<MoedaSelecionada> currentMoedaSelecionada =
        moedaDatabase.currentMoedaSelecionada;

    String titulolista = currentMoedaSelecionada.isNotEmpty
        ? 'Sua lista de moedas.'
        : 'Sua Lista está vazia.';
    return DefaultTabController(
      length: 3, // Define o número de tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.color1,
          centerTitle: true,
          title: const Text(
            'Datachamp Coins',
            style: TextStyle(
              color: AppColors.color2,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Cadastro'),
              Tab(text: 'Seleção'),
              Tab(text: 'Grafíco'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Scaffold(
              appBar: AppBar(
                  title: Center(
                child: Text(titulolista),
              )),
              body: Center(
                child: currentMoedaSelecionada.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Selecione suas moedas para começar!',
                            style: TextStyle(fontSize: 22),
                          ),
                          const SizedBox(height: 20),
                          FloatingActionButton(
                            backgroundColor: AppColors.color2,
                            onPressed: createMoedaSelecionada,
                            child: const Icon(Icons.add),
                          ),
                        ],
                      )
                    : Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Center(
                                child: ListView.builder(
                                  itemCount: currentMoedaSelecionada.length,
                                  itemBuilder: (context, index) {
                                    final moeda =
                                        currentMoedaSelecionada[index];
                                    return ListTile(
                                      title: Text(
                                          moeda.siglass), //////////////////
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            onPressed: () =>
                                                deleteMoedaSelecionada(
                                                    moeda.id),
                                            icon: const Icon(Icons.delete),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            FloatingActionButton(
                              backgroundColor: AppColors.color2,
                              onPressed: createMoedaSelecionada,
                              child: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
            const Column(),
            const Center(child: Text('Conteúdo do Grafíco')),
          ],
        ),
      ),
    );
  }

  Future<void> showSelectMoedaDialog(BuildContext context) async {}

  Future<void> showAddMoedaDialog(BuildContext context) async {}
}
