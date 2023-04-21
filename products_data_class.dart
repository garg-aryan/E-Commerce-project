import 'package:flutter/material.dart';
import 'package:flutter_all_in_one_ui/homepage%20work/productsdata.dart';


class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 29,
        child: ListTile(
            leading: Image.network(item.imageUrl),
            title: Text(item.name),
            subtitle: Text("must buy this phone "),
            trailing: Text("₹${item.price.toString()}")

        ),
      ),
    );
  }
}
