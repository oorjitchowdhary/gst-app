import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FAQs extends StatelessWidget {
  static final String id = "FAQs";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'FAQs',
          style: TextStyle(fontFamily: 'Lexend Deca')
        )
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
        width: double.maxFinite,
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('assets/faq.json'),
          builder: (context, snapshot){
            final data = jsonDecode(snapshot.data.toString());

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index){
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          data[index]['question'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lexend Deca',
                            color: Hexcolor('#0E2A47')
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          data[index]['answer'],
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Lexend Deca'
                          )
                        )
                      ],
                    ),
                  )
                );
              },
            );
          }
        )
      )
    );
  }
}