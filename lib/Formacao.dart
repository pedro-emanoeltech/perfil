import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:perfil/Formacao.dart';

class Formacao extends StatefulWidget {
  const Formacao({Key? key}) : super(key: key);

  @override
  _FormacaoState createState() => _FormacaoState();
}

class _FormacaoState extends State<Formacao> {
  Future<List> pegarPerfil() async {
    var url = Uri.parse('http://pedroemanoel98380.somee.com/Formacao/listar');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Erro ao Carregar Dados do Servidor');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Formacão'),
        ),
        body: FutureBuilder<List>(
          future: pegarPerfil(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Erro ao Carregar Formacão'),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 5, right: 300),
                          child: Center(
                            child: Text(
                              'Curso:',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 20, left: 10, right: 30),
                          child: Center(
                            child: Text(
                              '${snapshot.data![index]['Curso']}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 10, right: 260),
                          child: Center(
                            child: Text(
                              'Faculdade:',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 20, left: 10, right: 15),
                          child: Center(
                            child: Text(
                              '${snapshot.data![index]['Faculdade']}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 10, right: 265),
                          child: Center(
                            child: Text(
                              'Semestre: ',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 20, left: 10, right: 300),
                          child: Center(
                            child: Text(
                              '${snapshot.data![index]['SemestreAtual']}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 10, right: 150),
                          child: Center(
                            child: Text(
                              'Previão de Termino:',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 20, left: 10, right: 150),
                          child: Center(
                            child: Text(
                              '${snapshot.data![index]['PrevisaoTermino']}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 5, right: 300),
                          child: Center(
                            child: Text(
                              'Nivel:',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 20, left: 10, right: 150),
                          child: Center(
                            child: Text(
                              '${snapshot.data![index]['NivelFormacao']}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 20, left: 10, right: 1),
                          child: Center(
                            child: Text(
                              '___________________________________________',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ],
                  );
                },
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
