import 'package:flutter/material.dart';
import 'package:loja_virtual/tabs/home_tab.dart';
import 'package:loja_virtual/tabs/orders_tab.dart';
import 'package:loja_virtual/tabs/places_tab.dart';
import 'package:loja_virtual/tabs/products_tab.dart';
import 'package:loja_virtual/widgets/Cart_button.dart';
import 'package:loja_virtual/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
       Scaffold(
         body: HomeTab(),
           drawer: CustomDrawer(_pageController,),

         floatingActionButton: CartButton(),
       ),
        Scaffold(
    appBar: AppBar(
    title: Text('Produtos'),
    centerTitle: true,
    ),
    drawer: CustomDrawer(_pageController),
    body: ProductsTab(),
          floatingActionButton: CartButton(),
    ),
       Scaffold(
         appBar: AppBar(
           title: Text('Lojas',
           style: TextStyle(color: Color.fromARGB(255, 110, 39, 31)),
           ),
           centerTitle: true,
         ),
         body: PlacesTab(),
         drawer: CustomDrawer(_pageController),
       ),
       Scaffold(
         appBar: AppBar(
           title: Text('Meus Pedidos',
             style: TextStyle(color: Color.fromARGB(255, 110, 39, 31)),
           ),
           centerTitle: true,
         ),
         body: OrdersTab(),
         drawer: CustomDrawer(_pageController),
       ),
      ],
    );
  }
}
