import 'dart:convert';
import 'package:delivery_web/data/http/exceptions.dart';
import 'package:delivery_web/data/http/http_client.dart';
import 'package:delivery_web/model/orders_model.dart';

abstract class IOrdersRepository {
  Future<List<OrdersModel>> getOrders();
}

class OrdersRepository implements IOrdersRepository {
  final IHttpClient client;
  OrdersRepository({required this.client});

  @override
  Future<List<OrdersModel>> getOrders() async {
    String host = '';
    String port = '';
    String urlBase = 'http://$host:$port';

    final response = await client.get(
      url: '$urlBase/kds/listar?ultima_hora=1000',
    );

    if (response.statusCode == 200) {
      final List<OrdersModel> lstOrders = [];
      final body = jsonDecode(response.body);

      body['content'][0]['itens'].map((item) {
        final OrdersModel orders = OrdersModel.fromMap(item);
        lstOrders.add(orders);
      }).toList();

      return lstOrders;
    } else if (response.statusCode == 400) {
      throw NotFoundException('A url informada não encontrada.');
    } else if (response.statusCode == 404) {
      throw NotFoundException('Nenhum pedido encontrado.');
    } else {
      throw Exception('Não foi possível carregar os pedidos.');
    }
  }
}
