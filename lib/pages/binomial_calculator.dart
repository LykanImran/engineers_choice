import 'dart:ui' as prefix0;

import 'package:engineers_choice/model/binomial_model.dart';
import 'package:engineers_choice/utils/style_guide.dart';
import 'package:engineers_choice/widgets/company_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/widgets.dart';
import 'package:math_expressions/math_expressions.dart';

class BinomialCalculator extends StatefulWidget {
  @override
  _BinomialCalculatorState createState() => _BinomialCalculatorState();
}

class _BinomialCalculatorState extends State<BinomialCalculator> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  BinomialModel binomial;

  TextEditingController _aController;
  TextEditingController _bController;
  TextEditingController _nController;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool visible = false;

  @override
  void initState() {
    super.initState();
    binomial = BinomialModel();
    _aController = TextEditingController();
    _bController = TextEditingController();
    _nController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> resultTerms = [];

    int i;
    //print("Express>>>>  ${exp}");
    for (i = 0; i < binomial.term.length; i++) {
      resultTerms.add(_termBuilder(
          binomial.term[i], binomial.xPower[i], binomial.yPower[i]));
    }
    return Scaffold(
      backgroundColor: notWhite,
      appBar: AppBar(
        title: Text('Binomial Expander'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Text(
            ' Enter the Expression',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Form(
            key: _formKey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 5,
                ),
                _textfieldBuilder("a"),
                SizedBox(
                  width: 15,
                ),
                _textfieldBuilder("b"),
                SizedBox(
                  width: 15,
                ),
                _textfieldBuilder("n")
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            ' Result:-',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Visibility(
            visible: visible,
            child: Card(
              margin: EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 5.0, bottom: 0.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 3.0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                child: Center(
                  child: Wrap(
                    children: resultTerms,
                  ),
                ),
              ),
            ),
          ),
          // _resultDisplay(),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
//                color: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),

                onPressed: () => _clear(),
                child: Text('Reset'),
              ),
              SizedBox(
                width: 20,
              ),
              RaisedButton(
                color: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                onPressed: () {
                  calculate();
                  // exp();
                },
                child: Text(
                  'Go',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          CompanyLabel(Colors.blue),
        ],
      ),
    );
  }

  Widget _textfieldBuilder(String label) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.18,
      //height: 200,
      child: TextFormField(
        controller: label == "a"
            ? _aController
            : label == "b" ? _bController : _nController,
        keyboardType: TextInputType.numberWithOptions(),
        decoration: InputDecoration(
          suffixText: label == "a" ? "x" : label == "b" ? "y" : "",
          //suffix: Text("x"),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),

          //prefixIcon: Icon(Icons.person),
          labelText: '${label}',
          // hintText: 'Enter Your Name',
        ),
        textAlign: TextAlign.right,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Enter ${label}';
          }
          return null;
        },
        onSaved: (val) {
          if (label == "a") {
            this.binomial.a = int.parse(val);
            print("Val>>>> ${binomial.a}");
          } else if (label == "b") {
            this.binomial.b = int.parse(val);
            print("Val>>>> ${binomial.b}");
          } else {
            this.binomial.n = int.parse(val);
            print("Val>>>> ${binomial.n}");
          }
        },
      ),
    );
  }

  Widget _termBuilder(BigInt term, int xPower, int yPower) {
    String sign='';
    if (term > BigInt.from(0)) {
      sign = "+";
    } else {
      sign = "-";
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '${sign} ${term.toInt().abs()}',
          style: TextStyle(fontSize: 25),
        ),
        xPower != 0
            ? Text(
                'x',
                style: TextStyle(fontSize: 25),
              )
            : Text(""),
        xPower != 0 && xPower != 1 ? Text('${xPower}') : Text(""),
        yPower != 0
            ? Text(
                'y',
                style: TextStyle(fontSize: 25),
              )
            : Text(""),
        yPower != 0 && yPower != 1 ? Text('${yPower} ') : Text(" ")
      ],
    );
  }

  Widget _flipCard() {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.only(left: 32.0, right: 32.0, top: 20.0, bottom: 0.0),
      color: white,
      child: FlipCard(
        key: cardKey,
        direction: FlipDirection.HORIZONTAL,
        //speed: 5,
        front: Container(
          decoration: BoxDecoration(
            color: Color(0xFF006666),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Front', style: Theme.of(context).textTheme.headline),
              Text('Click here to flip back',
                  style: Theme.of(context).textTheme.body1),
            ],
          ),
        ),
        back: Container(
          decoration: BoxDecoration(
            color: Color(0xFF006666),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Back', style: Theme.of(context).textTheme.headline),
              Text('Click here to flip front',
                  style: Theme.of(context).textTheme.body1),
            ],
          ),
        ),
      ),
    );
  }

  void calculate() async {
    print("Enter calculate");
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
        visible =true;
        binomial.expansion();
      });
    }
  }

  void _clear() {
    setState(() {
      visible = false;
      // resultTerms= [];
      _aController.text = "";
      _bController.text = "";
      _nController.text = "";
    });
  }
}
