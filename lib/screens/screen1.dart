import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _lowerValue = 50;
  double _lowerValue1 = 1;
  double _upperValue = 180;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.filter_list), onPressed: () {}),
        ],
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "Sigma Tenant",
          style: TextStyle(color: Colors.black),
        ),
      ),
      drawer: customDrawer(),
      body: Container(
        child: Column(
          children: <Widget>[
            header(),
            Expanded(child: body()),
          ],
        ),
      ),
    );
  }

  String dropdownValue = 'One';
  Widget customDrawer() {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff6ca9eb), Color(0xff0057b5)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              height: 200,
              width: MediaQuery.of(context).size.width * 0.85,
              child: Container(
                child: Center(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/person.png"),
                      radius: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Hi, Samarth",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "samarth.gupta@gmail.com",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    GestureDetector(
                      child: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.filter_list),
                        SizedBox(width: 30),
                        DropdownButton<String>(
                          value: dropdownValue,
                          icon: Icon(Icons.keyboard_arrow_down),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.black),
                          underline: Container(
                            height: 0.2,
                            color: Colors.black,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: <String>['One', 'Two', 'Three', 'Four']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Price in INR"),
                      // SizedBox(height: 10),
                      FlutterSlider(
                        handlerWidth: 15,
                        hatchMark: FlutterSliderHatchMark(
                          distanceFromTrackBar: 5,
                          density: 0.5,
                          labels: [
                            FlutterSliderHatchMarkLabel(
                                percent: 0, label: Text('0')),
                            FlutterSliderHatchMarkLabel(
                                percent: 20, label: Text('1000')),
                            FlutterSliderHatchMarkLabel(
                                percent: 40, label: Text('2000')),
                            FlutterSliderHatchMarkLabel(
                                percent: 60, label: Text('3000')),
                            FlutterSliderHatchMarkLabel(
                                percent: 80, label: Text('4000')),
                            FlutterSliderHatchMarkLabel(
                                percent: 100, label: Text('5000'))
                          ],
                        ),
                        jump: true,
                        trackBar: FlutterSliderTrackBar(),
                        handler: FlutterSliderHandler(
                          decoration: BoxDecoration(),
                          child: Container(
                            decoration: new BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        rightHandler: FlutterSliderHandler(
                          decoration: BoxDecoration(),
                          child: Container(
                            decoration: new BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        values: [30000, 70000],
                        visibleTouchArea: true,
                        min: 0,
                        max: 100000,
                        touchSize: 15,
                        rangeSlider: true,
                        step: 1000,
                        onDragging: (handlerIndex, lowerValue, upperValue) {},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  height: 80,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Bedroom"),
                      FlutterSlider(
                        jump: true,
                        values: [10],
                        fixedValues: [
                          FlutterSliderFixedValue(percent: 0, value: "0"),
                          FlutterSliderFixedValue(percent: 20, value: "1000"),
                          FlutterSliderFixedValue(percent: 40, value: "2000"),
                          FlutterSliderFixedValue(percent: 60, value: "3000"),
                          FlutterSliderFixedValue(percent: 80, value: "4000"),
                          FlutterSliderFixedValue(percent: 100, value: "5000"),
                        ],
                        onDragging: (handlerIndex, lowerValue, upperValue) {
                          setState(() {
                            _lowerValue1 = lowerValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xff3186de), Color(0xff80abd9)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Container(
                        constraints:
                            BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Apply",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 60),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Become a Host"),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.language),
                  title: Text("Language"),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget header() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(2, 0, 2, 8),
        child: Container(
          decoration: new BoxDecoration(
              color: Colors.white,
              boxShadow: [
                new BoxShadow(
                  blurRadius: 20,
                  color: Colors.grey[500],
                  offset: new Offset(0.0, 10.0),
                )
              ],
              image: new DecorationImage(
                image: new AssetImage('assets/images/JL-Logo-150.png'),
              )),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
              hintText: "Search Your Location",
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<String> _cities = [
    "Chennai",
    "Kota",
    "BLR",
    "Jaipur",
    "Patna",
    "Kanpur",
    "Noida",
    "Delhi",
    "Kochi",
    "Indore",
    "Bhopal",
    "Mysore",
    "Jodhpur",
    "Vizag",
    "HYD",
    "Pune",
  ];

  Widget featuredItems() {
    return Container(
      height: 200,
      // color: Colors.red,
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            foregroundDecoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/apt.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Center(
                        child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(6, 0, 0, 0),
                              child: Text(
                                "Vividus",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(Icons.location_on),
                                Text("RT Nagar, Bangalore"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )),
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text("Per"),
                              Text("Day"),
                            ],
                          ),
                          Text(
                            "Rs. 1000",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget body() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 12, 8, 8),
                child: Text(
                  "City",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                height: 80,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _cities.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 35,
                          child: Text(
                            _cities[index],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 12, 8, 8),
                    child: Text(
                      "Featured",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      // height: 80,
                      child: ListView.builder(
                          itemCount: _cities.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: featuredItems(),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
