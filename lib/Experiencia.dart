import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:perfil/Experiencia.dart';

class Experiencia extends StatefulWidget {
  const Experiencia({Key? key}) : super(key: key);

  @override
  _ExperienciaState createState() => _ExperienciaState();
}

class _ExperienciaState extends State<Experiencia> {
  Future<List> pegarPerfil() async {
    var url =
        Uri.parse('http://pedroemanoel98380.somee.com/experiencia/listar');
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
          title: Text('Experiencia'),
        ),
        body: FutureBuilder<List>(
          future: pegarPerfil(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Erro ao Carregar Experiencia'),
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
                              top: 5, bottom: 20, left: 10, right: 300),
                          child: Center(
                            child: Text(
                              'Empresa',
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
                              '${snapshot.data![index]['Empresa']}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 10, right: 280),
                          child: Center(
                            child: Text(
                              'Admissão:',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 20, left: 10, right: 180),
                          child: Center(
                            child: Text(
                              '${snapshot.data![index]['Admissao']}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 10, right: 270),
                          child: Center(
                            child: Text(
                              'Demissão:',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 20, left: 10, right: 180),
                          child: Center(
                            child: Text(
                              '${snapshot.data![index]['Demissao']}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 10, right: 300),
                          child: Center(
                            child: Text(
                              'Funcão:',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 20, left: 10, right: 10),
                          child: Center(
                            child: Text(
                              '${snapshot.data![index]['Funcao']}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 5, right: 10),
                          child: Center(
                            child: Text(
                              'Descricão da Funcão:',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 20, left: 10, right: 10),
                          child: Center(
                            child: Text(
                              '${snapshot.data![index]['DescricaoFuncao']}',
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
