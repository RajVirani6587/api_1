import 'dart:html';

import 'package:api_1/shopapi/provider/shopprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class shopsecode_Screen extends StatefulWidget {
  const shopsecode_Screen({Key? key}) : super(key: key);

  @override
  State<shopsecode_Screen> createState() => _shopsecode_ScreenState();
}

class _shopsecode_ScreenState extends State<shopsecode_Screen> {
  shop_Provider? apiprovidert;
  shop_Provider? apiproviderf;
  @override
  Widget build(BuildContext context) {
    apiproviderf = Provider.of(context,listen: false);
    apiprovidert = Provider.of(context,listen: true);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.cyanAccent,
          centerTitle: false,
          title: Text("Product Detile",style: TextStyle(color: Colors.black),),
        ),
        body: Column(
          children: [
           Container(
             alignment: Alignment.topLeft,
             margin: EdgeInsets.all(10),
            height: 300,
            width: 300,
            child: Image.network("${apiproviderf!.Datapick!.image}"),
          ),
            Row(
              children: [
                Container(margin: EdgeInsets.all(8),child: Text("${apiproviderf!.Datapick!.id}] Product :-")),
                Text("${apiproviderf!.Datapick!.title}",overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 4,),
            Row(
              children: [
                Container(margin: EdgeInsets.all(8),child: Text("2] price/rating :-",)),
                Container(decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                ),child: Text("${apiproviderf!.Datapick!.price}\$ ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),)),
                SizedBox(width: 8,),
                Row(
                  children: [
                    Text("${apiproviderf!.Datapick!.rating!.rate}"),
                    Icon(Icons.star,color: Colors.amber,size: 13,),
                  ],
                )
              ],
            ),

            SizedBox(height: 4,),

            Row(
              children: [
                Container(margin: EdgeInsets.all(8),child: Text("3] category :-")),
                Text("${apiproviderf!.Datapick!.category}")
              ],
            ),

            SizedBox(height: 4,),

            Row(
              children: [
                Container(margin: EdgeInsets.all(8),child: Text("4] description :-")),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${apiproviderf!.Datapick!.description}",),
                      ),
                    ),
                  ],
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
