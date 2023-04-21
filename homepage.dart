
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_all_in_one_ui/homepage%20work/cart.dart';
import 'package:flutter_all_in_one_ui/homepage%20work/productsdata.dart';
import 'package:flutter_all_in_one_ui/homewidgets/homepagedetails.dart';
import 'package:flutter_all_in_one_ui/routclasses.dart';
import 'package:velocity_x/velocity_x.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, MyRouts.cartRout);
      },
        backgroundColor: Vx.indigo500,
      child: Icon(CupertinoIcons.cart),
      ),
     body: SafeArea(
       child: Container(
         padding: Vx.m32,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
            AppHeader(),
             if(CatalogModel.items.isNotEmpty)
               CatalogList().py16().expand()
             else
                CircularProgressIndicator().centered().expand(),

           ],
         ),
       ),
     ),
    );
  }
}
class AppHeader extends StatelessWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      color: Colors.greenAccent,
      child: Column(
        children: [
          "MashUp".text.orange700.xl5.bold.make(),
          SizedBox(height: 4,),
          "Trending Products".text.gray700.xl2.make(),
        ],
      ),
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap:true,
      itemCount: CatalogModel.items.length ,

        itemBuilder: (context,index){
          final catalog=CatalogModel.items[index];
          return InkWell(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(
                builder: (context)=>HomePageDetail(catalog: catalog),
            ),),
              child: CatalogItems(catalog: catalog,));
        }
        );
  }
}
class CatalogItems extends StatelessWidget {
  final Item catalog;

  const CatalogItems({super.key, required this.catalog}):assert(catalog!=null);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
              Hero(
                tag: Key(catalog.id.toString()),
                  child: Catalogimage(image: catalog.imageUrl)),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.bold.lg.color(Colors.deepPurpleAccent).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding:Vx.mH16,
                children: [
                  "₹${catalog.price}".text.bold.make(),
                  AddToCart(catalog: catalog),



                ],
              )
            ],
          ))
        ],
      ),
    ).color(Colors.black12).roundedSM.square(150).make().py16();
  }
}
class Catalogimage extends StatelessWidget {
  final String image;
  const Catalogimage({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return Image.network(image).box.roundedSM.p8.color(Colors.white70).make().p16().w40(context);
  }

}

class AddToCart extends StatefulWidget {
final Item catalog;
  const AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  State<AddToCart> createState() => AddToCartState();
}

class AddToCartState extends State<AddToCart> {

   final _cart =CartModel();
  @override
  Widget build(BuildContext context) {
    bool isAdded = _cart.items.contains(widget.catalog) ?? false;
    return ElevatedButton(
        onPressed:(){

         if(!isAdded){

           isAdded = isAdded.toggle();
         final catalog=CatalogModel();

         _cart.catalog=catalog;
         _cart.add(widget.catalog);
         setState(() {

         });
         }
        },
        style: ButtonStyle(

          backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
          shape: MaterialStateProperty.all(StadiumBorder()),
        ),

        child: isAdded? Icon(Icons.done): Icon(CupertinoIcons.cart_badge_plus));
  }
}

