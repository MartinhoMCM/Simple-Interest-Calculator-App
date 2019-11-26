import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: 8, top: 20.0),
        alignment: Alignment.center,
        color: Colors.deepPurpleAccent,
        child:
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded
                      (
                      child:  Text("Spice Jet",

                        style: TextStyle(
                            fontSize: 40, decoration: TextDecoration.none,
                            fontFamily: 'maven-pro',
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                        ),
                      ),

                    ),

                    Expanded(
                      child: Text("From Luanda to Huambo",
                        style: TextStyle(
                            fontSize: 20, decoration: TextDecoration.none,
                            fontFamily: 'maven-pro',
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                        ),
                      ),

                    ),

                  ],

                ),
                Row(
                  children: <Widget>[
                    Expanded
                      (
                      child:  Text("Air",

                        style: TextStyle(
                            fontSize: 40, decoration: TextDecoration.none,
                            fontFamily: 'maven-pro',
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                        ),
                      ),

                    ),

                    Expanded(
                      child: Text("From Luanda to Huila",
                        style: TextStyle(
                            fontSize: 20, decoration: TextDecoration.none,
                            fontFamily: 'maven-pro',
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                        ),
                      ),

                    ),

                  ],

                ),
                ImageAsset(),
                FinanceRaiseButton()
              ],
            )
      ),
    );
  }
}

class ImageAsset extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    AssetImage assetImage =AssetImage('images/finance.png');
    Image image = Image(image: assetImage,
    );
    return Container(child: image, width: 300, height: 300, ) ;
  }

}

class FinanceRaiseButton extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
     // margin: EdgeInsets.all(8.0),
     child: RaisedButton(
       color: Colors.deepOrange,
       elevation: 5.0,
       onPressed: ()
       {
         BookFinance(context);
       },
       child: Text("Enter", style: TextStyle(color: Colors.white , fontFamily: ' maven-pro'),),

     ),
    );
  }

  void BookFinance(BuildContext context)
  {
    var alertDialog =AlertDialog(
        title: Text('Entering...'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('You will never be satisfied.'),
              Text('You\’re like me. I’m never satisfied.'),
            ],
          ),
        )
    );

    showDialog(
        context: context,
    builder: (BuildContext context)
    {
      return alertDialog;
    });


  }

}



//Last Lesson 2.6 November 5, 2019