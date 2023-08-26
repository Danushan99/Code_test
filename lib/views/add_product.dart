// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:prac_test/app/app_constants.dart';
import 'package:prac_test/common/app_buttons.dart';
import 'package:prac_test/common/app_colors.dart';
import 'package:prac_test/common/app_styling.dart';
import 'package:prac_test/common/text_field.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../common/app_fields.dart';

class NewOrderPage extends StatefulWidget {
  const NewOrderPage({super.key});

  @override
  _NewOrderPageState createState() => _NewOrderPageState();
}

class _NewOrderPageState extends State<NewOrderPage> {
  late Database _database;
  final TextEditingController _customerController = TextEditingController();
  final TextEditingController _itemController = TextEditingController();
  final TextEditingController _paymentContoller = TextEditingController();
  int _quantity = 1;
  double _orderValue = 0.0;
  double _paymentAmount = 0.0;

  @override
  void initState() {
    super.initState();
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'order_database.db'),
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE IF NOT EXISTS orders(id INTEGER PRIMARY KEY, customer TEXT, item TEXT, quantity INTEGER, orderValue REAL, paymentAmount REAL)',
        );
      },
      version: 1,
    );

    await _database.execute(
      "CREATE TABLE IF NOT EXISTS orders("
      "id INTEGER PRIMARY KEY,"
      "customer TEXT,"
      "item TEXT,"
      "quantity INTEGER,"
      "orderValue REAL,"
      "paymentAmount REAL)",
    );
  }

  void _calculateOrderValue() {
    const unitPrice = 200.0;
    _orderValue = unitPrice * _quantity;
  }

  void _saveOrder() async {
    if (_customerController.text.isNotEmpty &&
        _itemController.text.isNotEmpty &&
        _paymentContoller.text.isNotEmpty) {
      await _database.insert(
        'orders',
        {
          'customer': _customerController.text,
          'item': _itemController.text,
          'quantity': _quantity,
          'orderValue': _orderValue,
          'paymentAmount': _paymentAmount,
        },
      );

      List<Map<String, dynamic>> queryResult = await _database.query('orders');
      print('Inserted ${queryResult.length} rows');

      _customerController.clear();
      _itemController.clear();
      _quantity = 1;
      _orderValue = 0.0;
      _paymentAmount = 0.0;
      _paymentContoller.clear();
      successToast("Order saved successfully");
 
      setState(() {});
    } else {
      failedToast("Customer and item fields must not be empty.");
      print("Customer and item fields must not be empty.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: kTopMarginOnBoarding,
          left: kLeftRightMarginOnBoarding,
          right: kLeftRightMarginOnBoarding,
          bottom: kBottomMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFields(
              hight: 50,
              hintText: 'Customer',
              keyboardType: TextInputType.name,
              width: 400,
              controller: _customerController,
            ),
            const SizedBox(height: 16),
            TextFields(
              hight: 50,
              hintText: 'Item',
              keyboardType: TextInputType.name,
              width: 400,
              controller: _itemController,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text(
                  'Quantity: ',
                  style: AppStyling.normal300Size15,
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    if (_quantity > 1) {
                      setState(() {
                        _quantity--;
                        _calculateOrderValue();
                      });
                    }
                  },
                ),
                Text('$_quantity',
                    style: const TextStyle(
                      fontFamily: 'Sk-Modernist',
                      color: AppColors.grayColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    )),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _quantity++;
                      _calculateOrderValue();
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text('Order Value: RS.$_orderValue',
                style: const TextStyle(
                  fontFamily: 'Sk-Modernist',
                  color: AppColors.grayColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                )),
            const SizedBox(height: 25),
            TextFields(
              hight: 50,
              hintText: 'Payment Amount',
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              width: 400,
              controller: _paymentContoller,
              onChanged: (value) {
                setState(() {
                  _paymentAmount = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            const Spacer(),
            AppButtons.button1(
              "Save Order",
              AppColors.whiteColor,
              AppColors.amberColor,
              MediaQuery.of(context).size.width - 32,
              _saveOrder,
            ),
            const SizedBox(
              height: kBottomMargin,
            ),
          ],
        ),
      ),
    );
  }
}
