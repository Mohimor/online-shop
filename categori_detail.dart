import 'dart:convert';
import 'package:flutter/material.dart';
import 'shopbottemna.dart';
import 'package:http/http.dart' as http;
import 'descriptionPage.dart';
import 'search.dart';
import 'categori.dart';

class CategoriDetailPage extends StatefulWidget {
  final String jsonurl;

  CategoriDetailPage(this.jsonurl);

  @override
  _CategoriDetailPageState createState() => _CategoriDetailPageState();
}

class _CategoriDetailPageState extends State<CategoriDetailPage> {
  List<ItemDetail> items = [];

  @override
  void initState() {
    super.initState();
    fetch();
  }

  void fetch() async {
    var url = Uri.parse(widget.jsonurl);
    http.Response response = await http.get(url);

    setState(() {
      var jsonResponse = json.decode(response.body) as Map<String, dynamic>;
      List<dynamic> detail = [];
      if (jsonResponse.containsKey('mobiles')) {
        detail = jsonResponse['mobiles'] as List<dynamic>;
      } else if (jsonResponse.containsKey('laptop')) {
        detail = jsonResponse['laptop'] as List<dynamic>;
      } else if (jsonResponse.containsKey('tablet')) {
        detail = jsonResponse['tablet'] as List<dynamic>;
      } else if (jsonResponse.containsKey('headphone')) {
        detail = jsonResponse['headphone'] as List<dynamic>;
      } else {
        detail = [];
      }
      items = detail.map((data) => ItemDetail.fromJsom(data)).toList();
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,body: Padding(
        padding: EdgeInsets.all(15),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 15,
          children: List.generate(items.length, (index) {
            return generateItem(items[index], context);
          }),
        ),
      ),
    );
  }
}

Card generateItem(ItemDetail item, context) {
  return Card(
    elevation: 7,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
    child: InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => description(item)));
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 90,
              width: 90,
              child: Image.network(item.imageurl),
            ),
            Text(
              item.name,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            Text(
              '${item.price}',
              style: TextStyle(color: Colors.red, fontSize: 14),
            ),
          ],
        ),
      ),
    ),
  );
}

class ItemDetail {
  final int id;
  final String name;
  final int price;
  final String imageurl;
  final String description;

  ItemDetail(this.id, this.name, this.price, this.imageurl, this.description);

  factory ItemDetail.fromJsom(Map<String, dynamic> json) {
    return ItemDetail(
      json['id'],
      json['name'],
      json['price'],
      json['image'],
      json['description'],
    );
  }
}
