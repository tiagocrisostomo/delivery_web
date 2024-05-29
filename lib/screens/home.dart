import 'package:delivery_web/data/colors/colors.dart';
import 'package:delivery_web/data/strings/strings.dart';
import 'package:delivery_web/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _bodyData(),
      bottomNavigationBar: _bottonAppBar(),
    );
  }

  _appBar() {
    Size size = MediaQuery.of(context).size;
    return AppBar(
      primary: true,
      leading: const Center(
        child: Text(
          'SPS FOODS',
          textAlign: TextAlign.center,
        ),
      ),
      toolbarHeight: size.height * 0.12,
      elevation: 10,
      centerTitle: true,
      backgroundColor: cor.backgroundColor,
      title: Column(
        children: [
          Row(
            children: [
              Text(global.CLINOME.toString(),
                  style: const TextStyle(fontSize: 25)),
            ],
          ),
          Row(
            children: [
              Text(
                '${global.CLIENDERECO}, ${global.CLINUMERO} - ${global.CLIBAIRRO} - ${global.CLIMUNICIPIO} - ${global.CLIUF}',
                style: const TextStyle(fontSize: 15),
              )
            ],
          ),
          Row(
            children: [
              Text(
                'CEP: ${global.CLICEP}  Telefone: ${global.CLITELEFONE}',
                style: const TextStyle(fontSize: 15),
              )
            ],
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    global.CLISTATUS.toString(),
                    softWrap: true,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 18, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                      color: Colors.blue,
                      iconSize: 40,
                      onPressed: () {},
                      icon: const Icon(Icons.settings_applications_rounded)),
                  IconButton(
                      color: Colors.yellow,
                      iconSize: 40,
                      onPressed: () {},
                      icon: const Icon(Icons.surround_sound_rounded)),
                  IconButton(
                      color: Colors.green,
                      iconSize: 40,
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const Home()));
                      },
                      icon: const Icon(Icons.refresh_rounded)),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  _bodyData() {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 2, bottom: 2, right: 2, left: 2),
            child: Container(
              decoration: BoxDecoration(
                color: cor.col1Color,
              ),
              width: size.width * 0.1986,
              child: Column(
                children: [
                  const Row(children: [Icon(Icons.search_rounded)]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      '${texto.col1} (${0})',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ]),
                  Divider(
                    color: cor.backgroundColor,
                    thickness: 2.0,
                  ),
                  //OS DADOS VIRÃO AQUI
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2, bottom: 2, right: 2),
            child: Container(
              decoration: BoxDecoration(
                color: cor.col2Color,
              ),
              width: size.width * 0.1986,
              child: Column(
                children: [
                  const Row(children: [Icon(Icons.search_rounded)]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      '${texto.col2} (${0})',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ]),
                  Divider(
                    color: cor.backgroundColor,
                    thickness: 2.0,
                  ),
                  //OS DADOS VIRÃO AQUI
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 2,
              bottom: 2,
              right: 2,
            ),
            child: Container(
              width: size.width * 0.1986,
              decoration: BoxDecoration(
                color: cor.col3Color,
              ),
              child: Column(
                children: [
                  const Row(children: [Icon(Icons.search_rounded)]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      '${texto.col3} (${0})',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ]),
                  Divider(
                    color: cor.backgroundColor,
                    thickness: 2.0,
                  ),
                  //OS DADOS VIRÃO AQUI
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2, bottom: 2, right: 2),
            child: Container(
              width: size.width * 0.1986,
              decoration: BoxDecoration(
                color: cor.col4Color,
              ),
              child: Column(
                children: [
                  const Row(children: [Icon(Icons.search_rounded)]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      '${texto.col4} (${0})',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ]),
                  Divider(
                    color: cor.backgroundColor,
                    thickness: 2.0,
                  ),
                  //OS DADOS VIRÃO AQUI
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2, bottom: 2, right: 2),
            child: Container(
              width: size.width * 0.1986,
              decoration: BoxDecoration(
                color: cor.col5Color,
              ),
              child: Column(
                children: [
                  const Row(children: [Icon(Icons.search_rounded)]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      '${texto.col5} (${0})',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ]),
                  Divider(
                    color: cor.backgroundColor,
                    thickness: 2.0,
                  ),
                  //OS DADOS VIRÃO AQUI
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _bottonAppBar() {
    return BottomAppBar(
      height: 30,
      elevation: 10,
      color: cor.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'V. ${global.APPVERSAO.toString()}',
            style: TextStyle(
              color: cor.textColor,
              fontSize: 15,
            ),
          ),
          Text(
            ' (${global.APPVERSAODATE.toString()})',
            style: TextStyle(
              color: cor.textColor,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
