// ignore_for_file: library_private_types_in_public_api, unnecessary_string_escapes

import 'package:flutter/material.dart';
import 'package:prac_test/common/app_styling.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key});

  @override
  _OrderListPageState createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  late Database _database;
  List<Map<String, dynamic>> _orders = [];

  @override
  void initState() {
    super.initState();
    _initDatabase().then((_) {
      _loadOrders();
    });
  }

  Future<void> _initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'order_database.db'),
      version: 1,
    );
  }

  Future<void> _loadOrders() async {
    final List<Map<String, dynamic>> orders = await _database.query('orders');
    setState(() {
      _orders = orders;
    });
  }

  Future<void> _deleteOrder(int id) async {
    await _database.delete('orders', where: 'id = ?', whereArgs: [id]);
    _loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order List'),
      ),
      body: ListView.builder(
        itemCount: _orders.length,
        itemBuilder: (context, index) {
          final order = _orders[index];
          return ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: Text('Customer: ${order['customer']}',
                style: AppStyling.normal400Size18),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Item: ${order['item']}',
                    style: AppStyling.normal400Size18),
                Text('Order Value: \RS.${order['orderValue']}',
                    style: AppStyling.normal400Size18),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete_sweep),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        'Delete Order',
                      ),
                      content: const Text(
                          'Are you sure you want to delete this order?'),
                      actions: [
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('Delete'),
                          onPressed: () {
                            _deleteOrder(order['id']);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}
