import 'package:flutter/material.dart';
import 'categori_detail.dart';
import 'package:proje1/ShopingBasketdata.dart';

typedef OnRemovePressed(int index);

class Shopingbasketitem extends StatefulWidget {
  ItemDetail _item;
  int count = 1;
  OnRemovePressed _onRemovePressed;
  int _index;

  Shopingbasketitem(this._item, this._onRemovePressed,this._index);

  @override
  State<Shopingbasketitem> createState() => _ShopingbasketitemState();
}

class _ShopingbasketitemState extends State<Shopingbasketitem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 200,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Image.network(
                widget._item.imageurl,
                height: 150,
                width: 90,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 20),
                  child: Text(
                    widget._item.name,
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Row(children: [
                    GestureDetector(
                      child: Icon(
                        Icons.add,
                        color: Colors.green,
                        size: 20,
                      ),
                      onTap: () {
                        Increment();
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${widget.count}',
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      child: Icon(
                        Icons.remove,
                        color: Colors.red,
                        size: 20,
                      ),
                      onTap: () {
                        Decrement();
                      },
                    ),
                  ]),
                )
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(right: 0, bottom: 0, top: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(child: Icon(Icons.delete_outline),onTap: () {
                        widget._onRemovePressed(widget._index);
                      },),
                      Text('${widget._item.price}')
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void Increment() {
    setState(() {
      widget.count++;
    });
  }

  void Decrement() {
    setState(() {
      if (widget.count == 0) {
        0;
      } else {
        widget.count--;
      }
    });
  }

}
