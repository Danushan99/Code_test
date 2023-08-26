// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:prac_test/common/app_card.dart';
import 'package:prac_test/common/app_colors.dart';
import 'package:prac_test/common/app_styling.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:prac_test/model/user_model.dart';
import '../app/router.dart' as route;
import '../common/app_fields.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late List<SalesData> _data;
  late List<charts.Series<SalesData, String>> _chartSeries;
  late GetUsersModel respones;
  @override
  void initState() {
    super.initState();

    _data = [
      SalesData('Target 1', 50000),
      SalesData('Target 2', 75000),
      SalesData('Target 2', 75000),
      SalesData('Achievement 1', 45000),
      SalesData('Achievement 2', 60000),
      SalesData('Achievement 2', 60000),
    ];

    _chartSeries = [
      charts.Series(
        id: 'Sales',
        data: _data,
        domainFn: (SalesData sales, _) => sales.label,
        measureFn: (SalesData sales, _) => sales.value,
        colorFn: (SalesData sales, _) => charts.ColorUtil.fromDartColor(
            sales.label.contains('Target') ? Colors.blue : Colors.green),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    respones = ModalRoute.of(context)?.settings.arguments as GetUsersModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: AppStyling.boldTextSize16,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: AppColors.primaryColor),
              accountName: Row(
                children: [
                  Text(
                    respones.loginDetails[0].firstName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    respones.loginDetails[0].lastName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              accountEmail: Text(
                respones.loginDetails[0].email,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: const FlutterLogo(),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
              ),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 380,
              height: 80,
              decoration: BoxDecoration(
                gradient: gradient7(),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Welome Back ",
                      style: AppStyling.normal500Size18.copyWith(
                        color: AppColors.amberColor,
                      ),
                    ),
                    Text(respones.loginDetails[0].lastName,
                        style: AppStyling.normal500Size18.copyWith(
                          color: AppColors.amberColor,
                        )),
                    const Text(
                      " 👋",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Row(
                children: [
                  Text(
                    'Sales Target vs Achievement',
                    style: AppStyling.normal400Size16,
                  ),
                ],
              ),
            ),
            //  const SizedBox(height: 5),
            Container(
              height: 300,
              padding: const EdgeInsets.only(right: 15, bottom: 15, left: 10),
              child: charts.BarChart(
                _chartSeries,
                animate: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CardFb2(
                      text: "New Order ",
                      subtitle: "click to add new procuts",
                      onPressed: () {
                        Navigator.pushNamed(context, route.addProduct);
                      }),
                  const SizedBox(height: 10),
                  CardFb2(
                      text: "View Order ",
                      subtitle: "click to View all procuts",
                      onPressed: () {
                        Navigator.pushNamed(context, route.viewProduct);
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SalesData {
  final String label;
  final int value;

  SalesData(this.label, this.value);
}
