import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/shopModel.dart';

class shop_Provider extends ChangeNotifier {
  List<dynamic> filterList = [];
  int i = 0;
  List<dynamic> mainList = [];

  ShopModel? Datapick;

  String shoplike = "https://fakestoreapi.com/products";

  Future<List> shopapifactory() async {
    var shopjavascript = await http.get(Uri.parse(shoplike));
    var shopnewproducte = jsonDecode(shopjavascript.body);
    return mainList = shopnewproducte.map((e) => ShopModel.fromJson(e)).toList();
  }

  void updateList(List list) {
    mainList = list;
    notifyListeners();
  }

  void filterprice() {
    for (i = 0; i < mainList.length; i++) {
      if (mainList[i].price! >= 0 && mainList[i].price! <= 49) {
        filterList.add(mainList[i]);
      }
    }
    mainList = filterList;
    print("=========================================== ${mainList.length}");
    notifyListeners();
  }

  void filterpricetwo() {
    for (i = 0; i < mainList.length; i++) {
      if (mainList[i].price! >= 50 && mainList[i].price! <= 99) {
        filterList.add(mainList[i]);
      }
    }
    mainList = filterList;
    notifyListeners();
  }

  void filterpricethree() {
    for (i = 0; i < mainList.length; i++) {
      if (mainList[i].price! >= 100) {
        filterList.add(mainList[i]);
      }
    }
    mainList = filterList;
    notifyListeners();
  }
}
