import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_aps/RandomWorld.dart';

void main() {
  runApp(MaterialApp(
    home: Home()
  ));
  }

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('My First App'),
       centerTitle: true,
       backgroundColor: Colors.red[600],
     ),
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.blue,
              child: Text('1'),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.redAccent,
              child: Text('2'),
            ),
          ),
          Expanded(
            flex: 1,
          child:Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.amber,
            child: Text('3'),
          )
          )
        ],
      ),
     floatingActionButton: FloatingActionButton(
       onPressed: () {},
       child: Text('click'),
       backgroundColor: Colors.red[600],
     ),
   );
  }
  }


