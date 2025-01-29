import 'package:flutter/material.dart';
import 'shopbottemna.dart';
class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
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
     );
  }
}
