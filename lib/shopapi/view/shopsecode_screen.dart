
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
          title: Text("Product Detail",style: TextStyle(color: Colors.black),),
        ),
        body: Column(
          children: [
           Container(
             margin: EdgeInsets.all(10),
            height: 300,
            width: 300,
            child: Image.network("${apiproviderf!.Datapick!.image}"),
          ),
            Row(
              children: [
                Container(margin: EdgeInsets.only(top: 8,left: 8,right: 8),child: Text("${apiproviderf!.Datapick!.id}] Product :-")),
              ],
            ),
            Container(margin: EdgeInsets.all(10),child: Text("${apiproviderf!.Datapick!.title}",style: TextStyle(fontWeight: FontWeight.bold),)),

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
                    Text("${apiproviderf!.Datapick!.rating!.rate}",style: TextStyle(fontWeight: FontWeight.bold),),
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
              ],
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15,right: 15),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("${apiproviderf!.Datapick!.description}",),
                ),
              ],
            ),

            Row(
              children: [
                Container(margin: EdgeInsets.all(8),child: Text("5] comments :-")),
                Text("${apiproviderf!.Datapick!.rating!.count}",style: TextStyle(fontWeight: FontWeight.bold),)
              ],
            )

          ],
        ),
      ),
    );
  }
}
