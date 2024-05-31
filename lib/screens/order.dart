import 'package:delivery_web/data/colors/colors.dart';
import 'package:delivery_web/data/strings/strings.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2, bottom: 2, right: 2, left: 2),
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
    );
  }
}
