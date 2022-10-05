
import 'package:api_1/shopapi/provider/shopprovider.dart';
import 'package:api_1/shopapi/view/shopfirst_screen.dart';
import 'package:api_1/shopapi/view/shopsecode_screen.dart';
import 'package:api_1/simpleapi/provider/apiprovider.dart';
import 'package:api_1/simpleapi/view/homeScren.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
      MultiProvider(
        providers: [
          ListenableProvider<Products_ProviderNew>(create: (context)=>Products_ProviderNew()),
          ListenableProvider<shop_Provider>(create:(context)=>shop_Provider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: 'shop',
          routes: {
            '/':(context)=>newjsonhome_Screen(),
            'shop':(context)=>shopFirst_Screen(),
            'shoptwo':(context)=>shopsecode_Screen(),
          },
        ),
      )
  );
}