import 'package:api_1/shopapi/model/shopModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/shopprovider.dart';

class shopFirst_Screen extends StatefulWidget {
  const shopFirst_Screen({Key? key}) : super(key: key);

  @override
  State<shopFirst_Screen> createState() => _shopFirst_ScreenState();
}

class _shopFirst_ScreenState extends State<shopFirst_Screen> {
   var shopapiT;
   var shopapiF;
  @override
  Widget build(BuildContext context) {
    shopapiF = Provider.of<shop_Provider>(context, listen: false);
    shopapiT = Provider.of<shop_Provider>(context, listen:true);
        return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text("amazon.in",style: TextStyle(color: Colors.black),),
            actions: [
              IconButton(onPressed:(){
                shopapiF.shopapifactory();
              }, icon: Icon(Icons.history,color: Colors.black,)),


              PopupMenuButton(itemBuilder: (context){
                return[
                  PopupMenuItem(onTap: (){
                     shopapiF.filterprice();
                  },
                    child: Text("\$0-49 price",style: TextStyle(fontSize: 20),),
                  ),
                  PopupMenuItem(onTap: (){
                    shopapiF.filterpricetwo();
                  },
                    child: Text("\$50-99 price",style: TextStyle(fontSize: 20)),
                  ),
                  PopupMenuItem(onTap: (){
                    shopapiF.filterpricethree();
                  },
                    child: Text("\$100-Upto price",style: TextStyle(fontSize: 20)),
                  ),
                ];
              },icon: Icon(Icons.more_vert,color: Colors.black,),)
            ],
          ),
          body: Center(
            child: FutureBuilder(
                future: Provider.of<shop_Provider>(context, listen: false).shopapifactory(),
                builder: (context, snapshot) {
                  if (snapshot.hasError)
                  {
                    return Text('${snapshot.error}');
                  }
                  else if (snapshot.hasData)
                  {
                    List  i1 = snapshot.data!;
                    return GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                              itemCount: i1.length,
                              itemBuilder:(context,index){
                                return InkWell(onTap: (){
                                  shopapiF.Datapick = ShopModel(
                                    category: i1[index].category,
                                    description: i1[index].description,
                                    id: i1[index].id,
                                    image: i1[index].image,
                                    price: i1[index].price,
                                    rating:i1[index].rating,
                                    title: i1[index].title);
                                    Navigator.pushNamed(context,'shoptwo');
                                },
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(margin: EdgeInsets.all(5),height: 115,width: 85,child: Image.network('${i1[index].image}')),
                                            Column(
                                              children: [
                                                Container(margin:EdgeInsets.all(5),child: Text("${i1[index].price}\$")),
                                                Row(
                                                  children: [
                                                    Text("${i1[index].rating.rate} "),
                                                    Icon(Icons.star,size: 13,color: Colors.amberAccent,),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(margin: EdgeInsets.only(top: 7,left: 7,right: 7),child: Text("${i1[index].title}",overflow:TextOverflow.ellipsis)),
                                      ],
                                    ),
                                  ),
                                );
                              }
                          );

                  }
                  return Center(child: CircularProgressIndicator());
                }),
          ),
        )
   );
  }
}
