import 'package:api_1/simpleapi/provider/apiprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class newjsonhome_Screen extends StatefulWidget {
  const newjsonhome_Screen({Key? key}) : super(key: key);

  @override
  State<newjsonhome_Screen> createState() => _newjsonhome_ScreenState();
}

class _newjsonhome_ScreenState extends State<newjsonhome_Screen> {
  var apiproviderT;
  var apiproviderF;

  @override
  Widget build(BuildContext context) {
    apiproviderF = Provider.of<Products_ProviderNew>(context, listen: false);
    apiproviderT = Provider.of<Products_ProviderNew>(context, listen: true);
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: FutureBuilder<List>(
            future: Provider.of<Products_ProviderNew>(context, listen: false)
                .apifactory(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else if (snapshot.hasData) {
                List l1 = snapshot.data!;
                return Expanded(
                  child: ListView.builder(
                    itemCount: l1.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text('${l1[index].userId}'),
                        title: Text('${l1[index].title}'),
                        trailing: Text('${l1[index].id}'),
                      );
                    },
                  ),
                );
              }
              return CircularProgressIndicator();
            }),
      ),
    ));
  }
}
