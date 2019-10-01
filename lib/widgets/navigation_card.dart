import 'package:engineers_choice/pages/binomial_calculator.dart';
import 'package:engineers_choice/utils/style_guide.dart';
import 'package:flutter/material.dart';

class NavigationCard extends StatelessWidget {
  String title;
  String imageUrl;
  Widget destination;
  NavigationCard({this.title ='', this.imageUrl='', this.destination = null});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        child: Card(
          color: white,
            elevation: 8,

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => destination));
                print('ontap is clicked');

              },

              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Image(
                        image: AssetImage("${imageUrl}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // image here
                    SizedBox(
                      height: 6,
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "${title}",
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
