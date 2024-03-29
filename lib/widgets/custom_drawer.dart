import 'package:flutter/material.dart';
import 'package:loja_virtual/Screens/login_screen.dart';
import 'package:loja_virtual/models/user_model.dart';
import 'package:loja_virtual/tiles/drawer_tile.dart';
import 'package:scoped_model/scoped_model.dart';

class CustomDrawer extends StatelessWidget {

  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {

    Widget _buildDrawerBack() => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 254, 207, 99),
            Colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8.0,
                      bottom: 0.0,
                      child: Text('BeeCake \nBolos e Doces',
                      style: TextStyle(
                        color: Color.fromARGB(255, 110, 39, 31),
                          fontSize: 34.0,
                          fontWeight:
                          FontWeight.bold),),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: ScopedModelDescendant<UserModel>(
                        builder: (context, child, model){
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Olá, ${!model.isLogedIn() ? '' : model.userData['name']}',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 110, 39, 31),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              GestureDetector(
                                child:  Text(
                                  !model.isLogedIn() ?
                                  'Entre ou cadastre-se >' : 'Sair',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 195, 78, 134),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                onTap: (){
                                  if(!model.isLogedIn())
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (context) => LoginScreen())
                                  );
                                  else
                                    model.signOut();
                                },
                              ),
                            ],
                          );
                        },
                      )
                    ),
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, 'Início', pageController, 0),
              DrawerTile(Icons.list, 'Produtos', pageController, 1),
              DrawerTile(Icons.location_on, 'Lojas', pageController, 2),
              DrawerTile(Icons.playlist_add_check, 'Meus pedidos', pageController, 3),
            ],
          ),
        ],
      ),
    );
  }
}
