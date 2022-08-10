import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sausage_api/sausage_api.dart';

import 'sausage_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greggs Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider(
      create: (context) => SausageProvider(SausageAPI())..init(),
      child: const MyHomeView(title: "Sausages")
    );
  }
}

class MyHomeView extends StatelessWidget {
  final String title;
  const MyHomeView({Key? key, required this.title}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Consumer<SausageProvider>(
      builder: (context, model, child){
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                height: 40,
                child: Text("Current Total basket Price: £${model.basketTotal}"),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: model.currentBasket.length,
                  itemBuilder: (context, idx){
                    final item = model.currentBasket[idx];
                    return ListTile(
                      leading: Image.network(item.thumbnailUri),
                      title: Text(item.articleName),
                      trailing: Text("${item.eatOutPrice}"),
                    );
                  },
                ),
              ),
            ],
          ),
          
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              model.addItemToBasket(model.sausage);
            },
            tooltip: 'Buy Me',
            child: const Icon(Icons.add),
          ),
    );
      },
    );
    

  }
}
