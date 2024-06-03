import 'dart:async';
import 'package:delivery_web/data/colors/colors.dart';
import 'package:delivery_web/data/http/http_client.dart';
import 'package:delivery_web/data/strings/strings.dart';
import 'package:delivery_web/repository/orders_repository.dart';
import 'package:delivery_web/screens/order.dart';
import 'package:delivery_web/settings/settings.dart';
import 'package:delivery_web/store/orders_store.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final OrdersStore store = OrdersStore(
    repository: OrdersRepository(
      client: HttpClient(),
    ),
  );

  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() async {
      // await store.getOrders();
    });

    const secs = Duration(seconds: 30);
    Timer.periodic(secs, (timer) async {
      // await store.getOrders();
    });
  }

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
    return AnimatedBuilder(
        animation: Listenable.merge([
          store.isLoading,
          store.erro,
          store.state,
        ]),
        builder: (conext, child) {
          if (store.isLoading.value) {
            return Center(
              child: RefreshProgressIndicator(
                backgroundColor: cor.backgroundColor,
                color: cor.col3Color,
              ),
            );
          }

          if (store.erro.value.isNotEmpty) {
            return Center(
              child: Text(
                store.erro.value,
                textAlign: TextAlign.center,
              ),
            );
          }

          if (store.state.value.isNotEmpty) {
            return const Center(
              child: OrderScreen(),
            );
          } else {
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 2, bottom: 2, right: 2, left: 2),
                  child: Container(
                    decoration: BoxDecoration(
                      color: cor.col1Color,
                    ),
                    width: size.width * 0.1986,
                    child: Column(
                      children: [
                        const Row(children: [Icon(Icons.search_rounded)]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 3, right: 3, left: 3),
                          child: InkWell(
                            onTap: () {
                              _orderDetailPendding(conext);
                            },
                            child: const Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        softWrap: true,
                                        "#${'1314'}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 10,
                                      child: Text(
                                        softWrap: true,
                                        'CAMARAO NAU DUPLO',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          '12:19',
                                          textAlign: TextAlign.left,
                                        )),
                                    Expanded(
                                        flex: 10,
                                        child: Text(
                                          '0800 705 2030',
                                          textAlign: TextAlign.right,
                                        )),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'R\$ 119,90',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const Text(
                          '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -',
                        ),
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
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 3, right: 3, left: 3),
                          child: InkWell(
                            onTap: () {
                              _orderDetailProduction(conext);
                            },
                            child: const Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        softWrap: true,
                                        "#${'1312'}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 10,
                                      child: Text(
                                        softWrap: true,
                                        'CAMARAO NAU DUPLO',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          '12:10',
                                          textAlign: TextAlign.left,
                                        )),
                                    Expanded(
                                        flex: 10,
                                        child: Text(
                                          '0800 705 2030',
                                          textAlign: TextAlign.right,
                                        )),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'R\$ 119,90',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const Text(
                          '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -',
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 3, right: 3, left: 3),
                          child: InkWell(
                            onTap: () {
                              _orderDetailProduction(conext);
                            },
                            child: const Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        softWrap: true,
                                        "#${'1313'}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 10,
                                      child: Text(
                                        softWrap: true,
                                        'CAMARAO NAU INDIVIDUAL',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          '12:09',
                                          textAlign: TextAlign.left,
                                        )),
                                    Expanded(
                                        flex: 10,
                                        child: Text(
                                          '0800 705 2030',
                                          textAlign: TextAlign.right,
                                        )),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'R\$ 89,90',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const Text(
                          '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -',
                        ),
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
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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

                        Padding(
                          padding:
                              const EdgeInsets.only(top: 3, right: 3, left: 3),
                          child: InkWell(
                            onTap: () {
                              _orderDetailSending(conext);
                            },
                            child: const Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        softWrap: true,
                                        "#${'1309'}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 10,
                                      child: Text(
                                        softWrap: true,
                                        'CAMARAO NAU DUPLO',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          '12:10',
                                          textAlign: TextAlign.left,
                                        )),
                                    Expanded(
                                        flex: 10,
                                        child: Text(
                                          '0800 705 2030',
                                          textAlign: TextAlign.right,
                                        )),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'R\$ 119,90',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const Text(
                          '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -',
                        ),
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
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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

                        Padding(
                          padding:
                              const EdgeInsets.only(top: 3, right: 3, left: 3),
                          child: InkWell(
                            onTap: () {
                              _orderDetailSending(conext);
                            },
                            child: const Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        softWrap: true,
                                        "#${'1309'}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 10,
                                      child: Text(
                                        softWrap: true,
                                        'CAMARAO NAU DUPLO',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          '12:10',
                                          textAlign: TextAlign.left,
                                        )),
                                    Expanded(
                                        flex: 10,
                                        child: Text(
                                          '0800 705 2030',
                                          textAlign: TextAlign.right,
                                        )),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'R\$ 119,90',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const Text(
                          '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -',
                        ),
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
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 3, right: 3, left: 3),
                          child: InkWell(
                            onTap: () {
                              _orderDetailSending(conext);
                            },
                            child: const Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        softWrap: true,
                                        "#${'1309'}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 10,
                                      child: Text(
                                        softWrap: true,
                                        'CAMARAO NAU DUPLO',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          '12:10',
                                          textAlign: TextAlign.left,
                                        )),
                                    Expanded(
                                        flex: 10,
                                        child: Text(
                                          '0800 705 2030',
                                          textAlign: TextAlign.right,
                                        )),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'R\$ 119,90',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const Text(
                          '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        });
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

  Future<void> _orderDetailPendding(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      useRootNavigator: true,
      useSafeArea: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Detalhes do Pedido',
            style: TextStyle(color: cor.backgroundColor),
          ),
          content: Text(
            'Maiores detalhes do pedido serão informados aqui.',
            style: TextStyle(color: cor.backgroundColor),
          ),
          actions: [
            OutlinedButton(
              child: Text(
                'Confirmar Pedido',
                style: TextStyle(
                    color: cor.certoColor, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                //chama o metodo que muda o estado, confirmando do pedido.
                Navigator.of(context).pop();
              },
            ),
            OutlinedButton(
              child: Text(
                'Fechar',
                style: TextStyle(
                    color: cor.erroColor, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  Future<void> _orderDetailProduction(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      useRootNavigator: true,
      useSafeArea: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Detalhes do Pedido',
            style: TextStyle(color: cor.backgroundColor),
          ),
          content: Text(
            'Maiores detalhes do pedido serão informados aqui.',
            style: TextStyle(color: cor.backgroundColor),
          ),
          actions: [
            OutlinedButton(
              child: Text(
                'Cancelar Pedido',
                style: TextStyle(
                    color: Colors.amber.shade800, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                //chama o metodo que muda o estado, cancelando do pedido.
                Navigator.of(context).pop();
              },
            ),
            OutlinedButton(
              child: Text(
                'Imprimir',
                style: TextStyle(
                    color: cor.col4Color, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            OutlinedButton(
              child: Text(
                'Fechar',
                style: TextStyle(
                    color: cor.erroColor, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  Future<void> _orderDetailSending(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      useRootNavigator: true,
      useSafeArea: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Detalhes do Pedido',
            style: TextStyle(color: cor.backgroundColor),
          ),
          content: Text(
            'Maiores detalhes do pedido serão informados aqui.',
            style: TextStyle(color: cor.backgroundColor),
          ),
          actions: [
            OutlinedButton(
              child: Text(
                'Imprimir',
                style: TextStyle(
                    color: cor.col4Color, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            OutlinedButton(
              child: Text(
                'Fechar',
                style: TextStyle(
                    color: cor.erroColor, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
