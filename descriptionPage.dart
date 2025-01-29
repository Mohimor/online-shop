import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proje1/ShopingBasketdata.dart';
import 'shopbottemna.dart';
import 'categori_detail.dart';
import 'search.dart ';

class description extends StatelessWidget {
  final ItemDetail item;

  description(this.item);

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            //child: Image.asset(),
          ),
          SizedBox(height: 30),
          Center(
            child: Image.network(
              item.imageurl,
              height: 300,
              width: 280,
            ),
          ),
          SizedBox(
            height: 13,
          ),
          Text(
            item.name,
            style: TextStyle(color: Colors.black, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            '${item.price}',
            style: TextStyle(color: Colors.red[900], fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            utf8.decode(item.description.runes.toList()),
            style: TextStyle(color: Colors.brown, fontFamily: "Vazir"),
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {

              ShopingBasketdata().addItem(item);

            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red[700],
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Text(
                  "افزودن به سبد خرید",
                  style: TextStyle(
                      color: Colors.white, fontFamily: "Vazir", fontSize: 12),
                ),
              ),
              height: 50,
              width: MediaQuery.of(context).size.width - 50,
            ),
          ),
        ],
      ),
    );
  }
}
