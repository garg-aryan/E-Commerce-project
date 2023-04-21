import 'package:flutter_all_in_one_ui/homepage%20work/productsdata.dart';

class CartModel{
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel()=>cartModel;
late CatalogModel _catalog;
  final List<int>_itemId=[];
  CatalogModel get catalog => _catalog;

  set catalog (CatalogModel newCatalog){
    assert(newCatalog!=null);
    _catalog=newCatalog;
  }
List<Item> get items => _itemId.map((id) => _catalog.getById(id)).toList();

  num get totalPrice => items.fold(0, (total, current) => total + current.price);

  void add(Item item){
    _itemId.add(item.id);
  }

  void remove(Item item){
    _itemId.remove(item.id);
  }
}