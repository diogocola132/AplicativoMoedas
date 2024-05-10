import 'package:http/http.dart' as http;

abstract class IhttpClient {
  Future get({required String url});
}

class HttpClient implements IhttpClient {
  final client = http.Client();

  @override
  Future get({required String url}) async {
    return await client.get(Uri.parse(url));
  }
}
//IhttpClient: Esta é uma interface que declara um método get. Este método é esperado para retornar
//um Future que completa com a resposta de uma solicitação GET para a URL fornecida.

//HttpClient: Esta é uma classe que implementa a interface IhttpClient.
// Ela usa a biblioteca http do Dart para fazer solicitações HTTP.

//client: Uma instância de http.Client da biblioteca http.
// Este é um cliente HTTP de baixo nível que pode ser usado para fazer solicitações HTTP.

//get: Este método faz uma solicitação GET para a URL fornecida e retorna a resposta.
// Ele usa o método get do client para fazer a solicitação.

//Este código é um exemplo de como você pode abstrair a lógica de fazer solicitações HTTP em uma classe separada.
// Isso torna seu código mais testável e modular, pois você pode facilmente trocar diferentes implementações de IhttpClient.
// Além disso, ao usar uma interface, você pode garantir que qualquer classe que implemente IhttpClient terá o método get,
// independentemente de como a solicitação HTTP é realmente feita. Isso é conhecido como o princípio de substituição de Liskov em SOLID.