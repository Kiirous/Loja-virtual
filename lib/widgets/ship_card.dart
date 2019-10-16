import 'package:flutter/material.dart';
import 'package:loja_virtual/models/cart_model.dart';
class ShipCard extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    String pagamento = ""; //temporariamente armazena o desconto
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ExpansionTile(
        title: Text('Forma de pagamento',
          textAlign: TextAlign.start,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey[700]
          ),
        ),
        leading: Icon(Icons.payment),
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              Padding(padding: EdgeInsets.all(8.0),
                child: RaisedButton(
                    child: Text('Crédito', style: TextStyle(color: Color.fromARGB(255, 110, 39, 31))),
                    color: Theme.of(context).primaryColor,
                    onPressed: (){
                      final snackBar = SnackBar(
                        backgroundColor: Colors.green.withOpacity(0.9),
                        content: Text('Crédito selecionado!'),
                        action: SnackBarAction(label: 'Entendi',textColor: Colors.white, onPressed: (){

                        },),
                      );
                      pagamento = "Credito";
                      CartModel.of(context).setPagamento(pagamento);
                      Scaffold.of(context).showSnackBar(snackBar);
                    }
                ),
              ),
              Padding(padding: EdgeInsets.all(8.0),
                child: RaisedButton(
                    child: Text('Débito', style: TextStyle(color: Color.fromARGB(255, 110, 39, 31)),),
                    color: Theme.of(context).primaryColor,
                    onPressed: (){
                      final snackBar = SnackBar(
                        backgroundColor: Colors.green.withOpacity(0.9),
                        content: Text('Débito selecionado!'),
                        action: SnackBarAction(label: 'Entendi',textColor: Colors.white, onPressed: (){

                        },),
                      );
                      pagamento = "Debito";
                      CartModel.of(context).setPagamento(pagamento);
                      Scaffold.of(context).showSnackBar(snackBar);
                    }
                ),
              ),
              Padding(padding: EdgeInsets.all(8.0),
                child: RaisedButton(
                    child: Text('Em dinheiro', style: TextStyle(color: Color.fromARGB(255, 110, 39, 31))),
                    color: Theme.of(context).primaryColor,
                    onPressed: (){
                      final snackBar = SnackBar(
                        backgroundColor: Colors.green.withOpacity(0.9),
                        content: Text('Em dinheiro selecionado!'),
                        action: SnackBarAction(label: 'Entendi',textColor: Colors.white , onPressed: (){

                        },),
                      );
                      pagamento = "Dinheiro";
                      CartModel.of(context).setPagamento(pagamento);
                      Scaffold.of(context).showSnackBar(snackBar);

                    }
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 10.0),
          ),
        ],
      ),
    );
  }
}
