import 'package:flutter/material.dart';
import 'package:prac_test/views/add_product.dart';
import 'package:prac_test/views/dashboard_page.dart';

import 'package:prac_test/views/login_view.dart';
import 'package:prac_test/views/order_list_view.dart';

const String lognView = 'lognview';
const String addProduct = 'addproduct';
const String viewProduct = 'viewproduct';
const String dashboardView = 'dashboardview';

class Routes {
  Routes._();

  static final routes = <String, WidgetBuilder>{
    lognView: (context) => const LoginView(),
    addProduct: (context) => const NewOrderPage(),
    viewProduct: (context) => const OrderListPage(),
    dashboardView: (context) => const DashboardPage(),
  };
}
