import 'package:delivery_web/data/http/exceptions.dart';
import 'package:delivery_web/model/orders_model.dart';
import 'package:delivery_web/repository/orders_repository.dart';
import 'package:flutter/material.dart';

class OrdersStore {
  final IOrdersRepository repository;

  OrdersStore({required this.repository});

  //variável reativa para o loading
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  //variável reativa para estado/state
  final ValueNotifier<List<OrdersModel>> state =
      ValueNotifier<List<OrdersModel>>([]);

  //variável reativa para erros
  final ValueNotifier<String> erro = ValueNotifier<String>('');

  Future getOrders() async {
    isLoading.value = true;
    try {
      final result = await repository.getOrders();
      state.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    }
    isLoading.value = false;
  }
}
