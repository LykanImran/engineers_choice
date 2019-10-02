import 'package:engineers_choice/model/arithmetic_model.dart';
import 'package:engineers_choice/utils/style_guide.dart';
import 'package:engineers_choice/widgets/company_label.dart';
import 'package:flutter/material.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

class ArithmeticCalculator extends StatefulWidget {
  @override
  _ArithmeticCalculatorState createState() => _ArithmeticCalculatorState();
}

class _ArithmeticCalculatorState extends State<ArithmeticCalculator> {
  ArithmeticModel arithmetic = ArithmeticModel(num1: 4, num2: -6);
  String ops = "+";
  String result;
  TextEditingController _aController;
  TextEditingController _bController;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool visible = false;

  @override
  void initState() {
    super.initState();
    ops = "+";
    _aController = new TextEditingController();
    _bController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: notWhite,
      appBar: AppBar(
        title: Text('Arithmetic Solver'),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: _textfieldBuilder("a"),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Text(
                    '${ops}',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: _textfieldBuilder("b"),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            ' Operations:-',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          radio(),
          SizedBox(
            height: 15,
          ),
          Text(
            ' Result:-',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Visibility(
            visible: visible,
            child: _resultDisplay(),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              RaisedButton(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                onPressed: () {
                  _clear();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text('Reset'),
                ),
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
                  //exp();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Go',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          CompanyLabel(Colors.black87)
        ],
      ),
    );
  }

  Widget _resultDisplay() {
    int resultDec;
    if (ops == "+") {
      resultDec = arithmetic.num1 + arithmetic.num2;
    }else if(ops == "-"){
      resultDec = arithmetic.num1 - arithmetic.num2;

    }
    return Card(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 0.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 3.0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "${arithmetic.displayString(arithmetic.binary1)}",
                  style: TextStyle(fontSize: 25, letterSpacing: 25),
                ),
                Text("(${arithmetic.num1})",
                    style: TextStyle(fontSize: 20, letterSpacing: 5))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "${arithmetic.displayString(arithmetic.binary2)}",
                  style: TextStyle(fontSize: 25, letterSpacing: 25),
                ),
                Text("(${arithmetic.num2})",
                    style: TextStyle(fontSize: 20, letterSpacing: 5))
              ],
            ),
            Divider(
              thickness: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "${result}",
                  style: TextStyle(fontSize: 25, letterSpacing: 25),
                ),
                Text("(${resultDec})",
                    style: TextStyle(fontSize: 20, letterSpacing: 5))
              ],
            ),

            /// Text(arithmetic.displayString(
            // arithmetic.solveAdd(arithmetic.num1, arithmetic.num2))),
          ],
        ),
      ),
    );
  }

  Widget radio() {
    return CustomRadioButton(
      enableShape: true,
      buttonColor: Theme.of(context).canvasColor,
      buttonLables: [
        '+  Add',
        '-  Substract',
      ],
      buttonValues: [
        "+",
        "-",
      ],
      radioButtonValue: (value) {
        print(value);
        setState(() {
          ops = value;
        });
      },
      selectedColor: Theme.of(context).accentColor,
    );
  }

  Widget _textfieldBuilder(String label) {
    return TextFormField(
      controller: label == "a" ? _aController : _bController,
      keyboardType: TextInputType.numberWithOptions(),
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),

        //prefixIcon: Icon(Icons.person),
        labelText: '${label}',
        // hintText: 'Enter Your Name',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Enter ${label}';
        }
        return null;
      },
      onSaved: (val) {
        label == "a"
            ? this.arithmetic.num1 = int.parse(val)
            : this.arithmetic.num2 = int.parse(val);
      },
    );
  }

  void calculate() async {
    print("Enter calculate");
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      switch (ops) {
        case "+":
          {
            print("Addd");
            setState(() {
              visible = true;
              result = arithmetic.solveAdd(arithmetic.num1, arithmetic.num2);
              print("Resilt>>>>>>>> ${result}");
            });
            break;
          }
        case "-":
          {
            print("substacrt");
            setState(() {
              visible = true;
              result =
                  arithmetic.solveSubstract(arithmetic.num1, arithmetic.num2);
            });
            break;
          }
      }
    }
  }

  void _clear() {
    setState(() {
      visible = false;
      _aController.text = "";
      _bController.text = "";
    });
  }
}
