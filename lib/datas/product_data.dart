import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData{

  String category;
  String id;

  String title;
  String description;

  num price;

  List images;
  List sizes;

  ProductData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    title = snapshot.data['title'];
    description = snapshot.data['description'];
    price = snapshot.data['price'];
    images = snapshot.data['images'];
    sizes = snapshot.data['sizes'];
  }

  Map<String, dynamic> toResumeMap(){
    return {
    'title': title,
    'description': description,
      'price': price,
    };
  }

}