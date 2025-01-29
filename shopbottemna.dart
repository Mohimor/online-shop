import 'package:flutter/material.dart';
import 'package:proje1/ShopingBasket.dart';

class shopbottemna extends StatelessWidget {
  const shopbottemna({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 40,
      color: Colors.white,
      shape: CircularNotchedRectangle(),
      notchMargin: 7.0,
      clipBehavior: Clip.antiAlias,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2 - 40,
              child: Row(
                children: [
                  Icon(
                    Icons.list,
                    color: Colors.blue,
                  ),
                  Icon(
                    Icons.perm_contact_cal,
                    color: Colors.blue,
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2 - 40,
              child: Row(
                children: [
                  IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Shopingbasket()));
                  }, icon: Icon(Icons.shopping_bag,color: Colors.blue,),),

                  Icon(
                    Icons.home,
                    color: Colors.blue,
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
            )
          ],
        ),
      ),
    );
  }
}
