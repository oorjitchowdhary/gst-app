import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import './faqs.dart';
import './report.dart';
import './chat.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Cyberbullying',
                style: TextStyle(
                  fontFamily: 'Lexend Deca',
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                )
              ),
              Text(
                'GST Project',
                style: TextStyle(
                  fontFamily: 'Lexend Deca',
                  fontSize: 20
                )
              ),
              SizedBox(height: 35.0),
              RaisedButton(
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: Text(
                    'FAQs',
                    style: TextStyle(fontFamily: 'Lexend Deca')
                  )
                ),
                onPressed: () {
                  Navigator.pushNamed(context, FAQs.id);
                },
              ),
              SizedBox(height: 10.0),
              RaisedButton(
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: Text(
                    'Report',
                    style: TextStyle(fontFamily: 'Lexend Deca')
                  )
                ),
                onPressed: () {
                  Navigator.pushNamed(context, Report.id);
                },
              ),
              SizedBox(height: 10.0),
              RaisedButton(
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: Text(
                    'Chat',
                    style: TextStyle(fontFamily: 'Lexend Deca')
                  )
                ),
                onPressed: () {
                  Navigator.pushNamed(context, Chat.id);
                },
              )
            ],
        ),
      )
    );
  }
}