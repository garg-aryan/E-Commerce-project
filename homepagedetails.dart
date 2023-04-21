import 'package:flutter/material.dart';
import 'package:flutter_all_in_one_ui/homepage%20work/productsdata.dart';
import 'package:flutter_all_in_one_ui/homepage.dart';
import 'package:velocity_x/velocity_x.dart';
class HomePageDetail extends StatelessWidget {
  final Item catalog;

  const HomePageDetail({super.key, required this.catalog}) :assert(catalog!=null);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.black12,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding:Vx.mH16,
          children: [
            "₹${catalog.price}".text.xl3.red800.bold.make(),

AddToCart(catalog: catalog)
            .wh(161, 55),
          ],
        )
      ),
      appBar: AppBar(
        backgroundColor: Colors.white70,
      ),
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: Column(
          children: [Hero
            (
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.imageUrl)
          ).h40(context),
            Expanded(child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: Colors.white70,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.center.size(22.0).color(Colors.deepPurpleAccent).make(),
                    SizedBox(height: 20,),
                    
                    catalog.decs.text.textStyle(context.captionStyle).make(),
                  ],
                ).py64(),
              ),
            ))
            ],
        ),
      ),
    );
  }
}
