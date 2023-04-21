import 'package:flutter/material.dart';
import 'package:flutter_all_in_one_ui/homepage%20work/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartListState().py32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart=CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "₹${_cart.totalPrice}".text.xl4.color(Vx.red800).make(),
          30.widthBox,
          ElevatedButton(onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Buying Not Supported Yet".text.make()));
          },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Vx.indigo400),
            ),
            child: "Buy".text.white.make(),
          ).w32(context),
        ],
      ),
    );
  }
}
class _CartListState extends StatefulWidget {
  const _CartListState({Key? key}) : super(key: key);

  @override
  State<_CartListState> createState() => _CartListStateState();
}

class _CartListStateState extends State<_CartListState> {
 final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.items?.length,
        itemBuilder: (context,index)=>ListTile(
         leading: Icon(Icons.done),
          trailing: IconButton(
            icon: Icon(Icons.remove_circle_outline),
            onPressed: () {
             _cart.remove(_cart.items[index]);
             setState(() {

             });
            },
          ),
          title: _cart.items[index].name.text.make( ),
        ));
  }
}
