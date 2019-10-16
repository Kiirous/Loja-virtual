import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/datas/product_data.dart';
import 'package:loja_virtual/tiles/product_tile.dart';

class CategoryScreen extends StatelessWidget {

  final DocumentSnapshot snapshot;

  CategoryScreen(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              snapshot.data['title'],
            style: TextStyle(
              color: Color.fromARGB(255, 110, 39, 31),
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(icon: Icon(
                Icons.grid_on,
                color: Color.fromARGB(255, 110, 39, 31),
              ),
              ),
              Tab(icon: Icon(
                  Icons.list,
                color: Color.fromARGB(255, 110, 39, 31),
              ),
              ),
            ],
          ),
        ),
        body: FutureBuilder<QuerySnapshot>(
          future: Firestore.instance.collection('products').document(snapshot.documentID)
            .collection('itens').getDocuments(),
            builder: (context, snapshot){
              if(!snapshot.hasData)
                return Center(child: CircularProgressIndicator(),);
              else
                return TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                     GridView.builder(
                       padding: EdgeInsets.all(4.0),
                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                           //quantidade de intes na horizontal
                             crossAxisCount: 2,
                           mainAxisSpacing: 4.0,
                           crossAxisSpacing: 4.0,
                           childAspectRatio: 0.65,
                         ),
                         //quantidade de itens que terá na grade
                         itemCount: snapshot.data.documents.length,
                         itemBuilder: (context, index){
                         ProductData data = ProductData.fromDocument(snapshot.data.documents[index]);
                         data.category = this.snapshot.documentID;
                         return ProductTile('grid', data);
                         }
                     ),
                      ListView.builder(
                        padding: EdgeInsets.all(4.0),
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index){
                            ProductData data = ProductData.fromDocument(snapshot.data.documents[index]);
                            data.category = this.snapshot.documentID;
                            return ProductTile('list', data);
                          }
                      ),
                    ]
                );
            }
        ),
      ),
    );
  }
}
