import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/Apicalls/calls.dart';
import 'package:flutter_application_1/Apicalls/styles/Dialogue.dart';

import '../styles.dart';

class PreedictionCall extends StatefulWidget {
  const PreedictionCall({super.key});

  @override
  State<PreedictionCall> createState() => _PreedictionCallState();
}

class _PreedictionCallState extends State<PreedictionCall> {
  @override
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();
  TextEditingController _controller5 = TextEditingController();
  TextEditingController _controller6 = TextEditingController();
  TextEditingController _controller7 = TextEditingController();
  TextEditingController _controller8 = TextEditingController();
  bool isLoading = true;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prediction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            TextField(
                controller: _controller1,
                style: inputstyle(),
                decoration: inputdec(
                    "Product Name*", Icons.production_quantity_limits)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            TextField(
                controller: _controller2,
                style: inputstyle(),
                decoration:
                    inputdec("Purchase Units*", Icons.numbers_outlined)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            TextField(
                controller: _controller3,
                style: inputstyle(),
                decoration: inputdec(
                    "Purchase Price*", Icons.monetization_on_outlined)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            TextField(
                controller: _controller4,
                style: inputstyle(),
                decoration:
                    inputdec("Total Price*", Icons.monetization_on_outlined)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            TextField(
                controller: _controller5,
                style: inputstyle(),
                decoration: inputdec("Sales unit*", Icons.numbers_outlined)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            TextField(
                controller: _controller6,
                style: inputstyle(),
                decoration:
                    inputdec("Sales Price*", Icons.monetization_on_outlined)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            TextField(
                controller: _controller7,
                style: inputstyle(),
                decoration:
                    inputdec("Total Price*", Icons.monetization_on_outlined)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            TextField(
                controller: _controller8,
                style: inputstyle(),
                decoration: inputdec("Profit*", Icons.numbers_outlined)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: MaterialButton(
                  child: isLoading
                      ? Text(
                          'Predict',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'SFUIDisplay',
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : CircularProgressIndicator(
                          color: Colors.white,
                        ),
                  color: Colors.cyan, //Color(0xffff2d55),
                  elevation: 0,
                  minWidth: 100,
                  height: 50,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () async {
                    setState(() {
                      isLoading = false;
                    });
                    String result = await Post(
                        _controller1.text,
                        _controller2.text,
                        _controller3.text,
                        _controller4.text,
                        _controller5.text,
                        _controller6.text,
                        _controller7.text,
                        _controller8.text);
                    setState(() {
                      isLoading = true;
                    });
                    if (result != "Error")
                      PredictionRes(context, result, _controller1.text);
                    else
                      PredictionRes(context, "Error", "");
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
