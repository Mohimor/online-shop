import 'package:flutter/material.dart';
import 'shopbottemna.dart';
import 'search.dart';
import 'ShopingBasketdata.dart';
import 'shopingbasketItem.dart';

class Shopingbasket extends StatefulWidget {
  const Shopingbasket({super.key});

  @override
  State<Shopingbasket> createState() => _ShopingbasketState();
}

class _ShopingbasketState extends State<Shopingbasket> {
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

      body: BasketUi(),

    );
  }

  Widget BasketUi(){

    return ListView.builder(
      itemBuilder: (context, index){
        return GestureDetector(

          child: Padding(
            padding: EdgeInsets.only(left: 15,right: 15,top: 10),
            child: Shopingbasketitem(ShopingBasketdata().basketItem[index],removeItem,index),
          ),

        );
      } ,
      itemCount: ShopingBasketdata().basketItem.length ,
    );

  }

  void removeItem(int index){

    setState(() {

      ShopingBasketdata().basketItem.removeAt(index);

    });

  }

}
