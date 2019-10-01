
import 'package:engineers_choice/model/binomial_model.dart';
import 'package:engineers_choice/pages/arithmetic_calcultor.dart';
import 'package:engineers_choice/pages/binomial_calculator.dart';
import 'package:engineers_choice/utils/style_guide.dart';
import 'package:engineers_choice/widgets/navigation_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BinomialCalculator _binomialCalculator;
  ArithmeticCalculator _arithmeticCalculator;

  @override
  void initState() {
    super.initState();
    _arithmeticCalculator = ArithmeticCalculator();
    _binomialCalculator = BinomialCalculator();
  }
  @override
  Widget build(BuildContext context) {

//    binomialModel.term;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Engineer's Choice"), centerTitle: true,),
      backgroundColor: notWhite,
      body: GridView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: <Widget>[
          NavigationCard(title: "Binomial",destination: _binomialCalculator, imageUrl: "assets/binomial.png",),//,
          NavigationCard(title: "Adder",destination: _arithmeticCalculator,imageUrl: "assets/binomial.png")// managementCardBuilder("assets/moneyup.png", "Analytics"),
        ],
      )
    );
  }
}
