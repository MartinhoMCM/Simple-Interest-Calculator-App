import 'package:flutter/material.dart';
void main()
{
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Exploring",
          home: SIForm(),
          theme: ThemeData(
            brightness: Brightness.dark,
          primaryColor: Colors.indigo, accentColor: Colors.indigoAccent,
              fontFamily: 'maven-pro-v13'

      ),
      )
  );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Exploring",
        home: SIForm()
    );
  }

}

class SIForm  extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SIFormState();
  }
}

class SIFormState  extends State<SIForm>{

  var _currencies =['Kwanzas', 'Dollars', 'Euro'];
  var minPadding=5.0;
  var _currentItemSelected='';
  var displayResult='';
  TextEditingController principalController = TextEditingController();
  TextEditingController rioController =TextEditingController();
  TextEditingController termController =TextEditingController();

  var _formkey =GlobalKey<FormState>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentItemSelected =_currencies[0];
  }


  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
      appBar: AppBar(title: Text ('Simple Interest Calculator App'),),
      body:  Form(
       key: _formkey,
       child: Padding(
         padding: EdgeInsets.all(minPadding*2),
         child: ListView(
       children: <Widget>[
       getImageAsset(),
        Padding(
          padding: EdgeInsets.all(minPadding),
          child: TextFormField(
            controller: principalController,
            keyboardType: TextInputType.number,
            style: textStyle,
            validator: (String value){
              if(value.isEmpty)
                return 'Please enter principal amount';
            },
            decoration: InputDecoration(
                labelStyle: textStyle,
                labelText: 'Principal',
                errorStyle: TextStyle
                  (
                  color: Colors.yellow,
                  fontSize: 15.0
                ),
                hintText: 'Enter Principal e.g 12000',
                border: OutlineInputBorder
                  (
                  borderRadius: BorderRadius.circular(minPadding),

                )
            ),

          ),
        ),

        Padding(
          padding: EdgeInsets.all(minPadding),
          child: TextFormField(
            controller: rioController,
            style: textStyle,
            validator: (String value){
              if(value.isEmpty)
                return 'Please enter Rate of Interest amount';
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              errorStyle: TextStyle(
                color: Colors.yellow,
                fontSize: 15.0
              ),
                labelStyle: textStyle,
                labelText: 'Rate of Interest',
                hintText: 'Enter Principal e.g 12000',
                border: OutlineInputBorder
                  (
                  borderRadius: BorderRadius.circular(minPadding),

                )
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(left: minPadding, bottom: minPadding),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: minPadding),
                  child: TextFormField(
                    validator: (String value){
                      if(value.isEmpty)
                        return 'Please enter term amount';
                    },
                    controller: termController,
                    keyboardType: TextInputType.number,
                    style: textStyle,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                        color: Colors.yellow,
                        fontSize: 15.0
                      ),
                        labelStyle: textStyle,
                        labelText: 'Terms',
                        hintText: 'Time in years',
                        border: OutlineInputBorder
                          (
                          borderRadius: BorderRadius.circular(minPadding),
                        )
                    ),
                  ),
                ),
              ),

              Container(width: minPadding*5,)
              ,
              Expanded( child: DropdownButton<String>(
                items: _currencies.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: textStyle,),

                  );
                }).toList(),
                onChanged: (String newValueSelected)
                {
                  _onDropDownItemSelected(newValueSelected);

                },
                value: _currentItemSelected,
              ),
              )
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.all(minPadding),
          child: Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  textColor: Theme.of(context).primaryColorDark,
                  child: Text('Calculate', textScaleFactor: 1.5, ),
                  onPressed: (){
                    setState(() {
                      if(_formkey.currentState.validate())
                         this.displayResult= _calculateTotalReturns();
                    });

                  },
                ),
              ),
              Expanded(
                child: RaisedButton(
                  color: Theme.of(context).primaryColorDark,
                  textColor: Theme.of(context).primaryColorLight,
                  child: Text('Reset', textScaleFactor: 1.5),
                  onPressed: (){
                    setState(() {
                      reset();
                    });
                  },
                ),
              )
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.all(minPadding),
          child: Text('$displayResult', style: textStyle,),
        )

        ],
      ),
       ),

    ),);
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/finance.png');
    return Container(
      margin: EdgeInsets.all(minPadding*10),
      child: Center(
          child: Image( image: assetImage, width: 125.0, height: 125.0,)),
    );
  }


  String setValue(String value)
  {
    String setValue =value;

    return setValue;
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
       this._currentItemSelected=newValueSelected;
    });
  }

  String  _calculateTotalReturns() {

    double principal =double.parse(principalController.text);
    double rio =double.parse(rioController.text);
    int term = int.parse(termController.text);
    double totalAmountPayable =principal+(principal*rio*term)/100;

    String result ='After $term years, your investiment will be worth $totalAmountPayable $_currentItemSelected';
    return result;
  }


   void reset(){
        principalController.text ='';
        rioController.text='';
        termController.text='';
        this.displayResult='';
        _currentItemSelected =_currencies[0];
   }



}


