import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

PredictionRes(var context, String Result, String Name) => showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        elevation: 5,
        title: Text(
          "Analysed Result",
          textAlign: TextAlign.center,
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Name != ""
                  ? Text("Hey!",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                  : Text(Name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Name != ""
                  ? Text(
                      "You need to $Result of $Name to make Profit",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                    )
                  : Text(""),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text(
                  'Close',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'SFUIDisplay',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: Colors.cyan, //Color(0xffff2d55),
                elevation: 0,
                minWidth: 60,
                height: 30,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              )
            ],
          ),
        ),
      ),
    );
