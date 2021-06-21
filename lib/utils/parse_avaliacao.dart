import 'package:comidinhas/models/avaliacao.dart';

double getAvaliacao(List<Avaliacao>? avaliacoes) {
  if (avaliacoes != null && avaliacoes.length > 0) {
    double somaAvaliacao = 0;

    avaliacoes.forEach((element) {
      somaAvaliacao = somaAvaliacao + element.value;
    });

    return somaAvaliacao / avaliacoes.length;
  }
  return 0;
}
