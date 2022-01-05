import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:perfil/Experiencia.dart';
import 'package:perfil/formacao.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  Future<List> pegarPerfil() async {
    var url = Uri.parse('http://pedroemanoel98380.somee.com/home/listar');
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
          title: Text('Perfil'),
          actions: <Widget>[
            // botao para troca de tela
            IconButton(
                icon: const Icon(Icons.school),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Formacao()));
                }),
            IconButton(
                icon: const Icon(Icons.work),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Experiencia()));
                }),
          ],
        ),
        body: FutureBuilder<List>(
          future: pegarPerfil(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Erro ao Carregar Perfil'),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(
                            'https://media-exp1.licdn.com/dms/image/C4D03AQGvwgSEXxPyHw/profile-displayphoto-shrink_800_800/0/1600739653385?e=1643241600&v=beta&t=b2tIwqhw-21jPfTk3cgyz4Wt4rScUcRIzLE8h_LrZA8'),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 20, left: 90, right: 30),
                          child: Center(
                            child: Text(
                              '${snapshot.data![index]['Nome']}',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Text(
                        'Idade',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 20, left: 10, right: 15),
                          child: Center(
                            child: Text(
                              '${snapshot.data![index]['Idade']}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Text(
                        'E-mail',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 20, left: 60, right: 15),
                          child: Center(
                            child: Text(
                              '${snapshot.data![index]['Email']}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Text(
                        'Celular',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${snapshot.data![index]['Celular']}',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 40, bottom: 10, left: 15, right: 15),
                          child: Center(
                            child: Text(
                              'Resumo',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 20, left: 15, right: 15),
                          child: Center(
                            child: Text(
                              '${snapshot.data![index]['Resumo']}',
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
