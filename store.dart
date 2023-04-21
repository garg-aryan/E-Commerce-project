import 'package:flutter_all_in_one_ui/homepage%20work/cart.dart';
import 'package:flutter_all_in_one_ui/homepage%20work/productsdata.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore{
  late CatalogModel catalog;
  late CartModel cart;

  MyStore(){
    catalog=CatalogModel();
    cart=CartModel();
    cart.catalog=catalog;
  }

}
