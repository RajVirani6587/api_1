import 'dart:convert';
import 'package:api_1/simpleapi/model/apimodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Products_ProviderNew extends ChangeNotifier{

  String postlike = "https://jsonplaceholder.typicode.com/posts";
  List<dynamic>tt = [];



  Future<List> apifactory()async {

    var javascript = await http.get(Uri.parse(postlike));
    var newproducte = jsonDecode(javascript.body);
   return tt = newproducte.map((e) =>Apimodel.fromJson(e)).toList();
  }
}