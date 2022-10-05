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
   shop_Provider? shopapiT;
   shop_Provider? shopapiF;
  @override
  Widget build(BuildContext context) {
    shopapiF = Provider.of<shop_Provider>(context, listen: false);
    shopapiT = Provider.of<shop_Provider>(context, listen:true);

        return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.cyanAccent,
            centerTitle: false,
            title: Text("amazon.in",style: TextStyle(color: Colors.black),),
            actions: [
              IconButton(onPressed:(){
                shopapiF!.shopapifactory();
              }, icon: Icon(Icons.history,color: Colors.black,)),


              PopupMenuButton(itemBuilder: (context){
                return[
                  PopupMenuItem(onTap: (){
                     shopapiF!.filterprice();
                  },
                    child: Text("\$0-49 price",style: TextStyle(fontSize: 20),),
                  ),
                  PopupMenuItem(onTap: (){
                    shopapiF!.filterpricetwo();
                  },
                    child: Text("\$50-99 price",style: TextStyle(fontSize: 20)),
                  ),
                  PopupMenuItem(onTap: (){
                    shopapiF!.filterpricethree();
                  },
                    child: Text("\$100-Upto price",style: TextStyle(fontSize: 20)),
                  ),
                ];
              },icon: Icon(Icons.more_vert,color: Colors.black,),)
            ],
          ),
          body: Center(
            child: FutureBuilder<List>(
                future: Provider.of<shop_Provider>(context, listen: false).shopapifactory(),
                builder: (context, snapshot) {
                  if (snapshot.hasError)
                  {
                    return Text('${snapshot.error}');
                  }

                  else if (snapshot.hasData)
                  {
                    if(shopapiF!.mainList.isEmpty)
                      {
                        shopapiF!.updateList(snapshot.data!);
                      }
                    return GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                              itemCount: shopapiT!.mainList.length,
                              itemBuilder:(context,index){
                                return InkWell(onTap: (){
                                  shopapiF!.Datapick = ShopModel(
                                    category: shopapiF!.mainList[index].category,
                                    description: shopapiF!.mainList[index].description,
                                    id: shopapiF!.mainList[index].id,
                                    image: shopapiF!.mainList[index].image,
                                    price: shopapiF!.mainList[index].price,
                                    rating:shopapiF!.mainList[index].rating,
                                    title: shopapiF!.mainList[index].title);
                                    Navigator.pushNamed(context,'shoptwo');
                                },
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(margin: EdgeInsets.all(5),height: 115,width: 85,child: Image.network('${shopapiT!.mainList[index].image}')),
                                            Column(
                                              children: [
                                                Container(margin:EdgeInsets.all(5),child: Text("${shopapiT!.mainList[index].price}\$")),
                                                Row(
                                                  children: [
                                                    Text("${shopapiT!.mainList[index].rating.rate} "),
                                                    Icon(Icons.star,size: 13,color: Colors.amberAccent,),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(margin: EdgeInsets.only(top: 7,left: 7,right: 7),child: Text("${shopapiT!.mainList[index].title}",overflow:TextOverflow.ellipsis)),
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
