import 'dart:convert';
import 'package:flutter/material.dart';
import 'shopbottemna.dart';
import 'package:http/http.dart' as http;
import 'search.dart';
import 'categori_detail.dart';  // اضافه کردن این ایمپورت

void main() => runApp(MainMaterial());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class MainMaterial extends StatelessWidget {
  const MainMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}


class _MyAppState extends State<MyApp> {
  List<Item> items = [];

  @override
  void initState() {
    super.initState();
    fetch();
  }

  void fetch() async {
    var url = Uri.parse("https://s6.uplod.ir:182/d/2k23gsmo4eqkae6tmknzljlxvidnbpoca66plujpppsgtepxckxil34isqhy7eiyrpjnhg3w/categorij.json");
    http.Response response = await http.get(url);


      setState(() {
        var jsonResponse = json.decode(response.body) as Map<String, dynamic>;
        var categories = jsonResponse['categories'] as List<dynamic>;
        items = categories.map((data) => Item.fromJson(data)).toList();
      });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "فروشگاه",
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.blue,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),

        backgroundColor: Colors.white,
        elevation: 0,
      ),
        bottomNavigationBar: shopbottemna(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => Searchpage()));
          },
          backgroundColor: Colors.deepOrange[400],
          child: Icon(Icons.search,color: Colors.blue,),
          shape: CircleBorder(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Padding(
          padding: EdgeInsets.all(15),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15,
            children: List.generate(items.length, (index) {
              return generateItem(items[index],context);  // اضافه کردن context
            }),
          ),
        ),
        backgroundColor: Colors.white,
    );
  }
}

class Item {
  final int id;
  final String name;
  final String imageUrl;
  final String jsonUrl;

  Item(this.id, this.name, this.imageUrl, this.jsonUrl);

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      json['id'],
      json['name'],
      json['image'],
      json['jsonurl'],  // اضافه کردن فیلد jsonUrl
    );
  }
}

Card generateItem(Item item,context) {  // اضافه کردن context
  return Card(
    elevation: 7,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
    child: InkWell(
      onTap: () {
        Navigator.of(context,).push(MaterialPageRoute(builder: (context) => CategoriDetailPage(item.jsonUrl)));
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 90,
              width: 90,
              child: Image.network(item.imageUrl),
            ),
            Text(  
              item.name,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
      ),
    ),
  );
}
