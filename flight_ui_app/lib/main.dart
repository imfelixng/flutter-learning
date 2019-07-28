import 'package:flutter/material.dart';

import 'CustomShapeClipper.dart';

void main() => runApp(MaterialApp(
  title: 'FLight lisy Mock up',
  debugShowCheckedModeBanner: false,
  home: HomeScreen(),
  theme: appTheme,
));

Color firstColor = Color(0xfff47d15);
Color secondColor = Color(0xffef772c);

ThemeData appTheme = ThemeData(
  primaryColor: Color(0xfff37918),
  fontFamily: 'Oxygen',
);

TextStyle dropDownLabelStyle = TextStyle(
  color: Colors.white,
  fontSize: 16,
);

TextStyle dropDownMenuItemStyle = TextStyle(
  color: Colors.black,
  fontSize: 18,
);

List<String> locations = ['Boston (BOS)', 'New York City (JFK)'];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          HomeScreenTopPart(),
        ],
      ),
    );
  }
}

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {

  var selectedLocationItem = 0;
  var isFlightSelected = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 400,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [firstColor, secondColor]),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      PopupMenuButton(
                        onSelected: (value) {
                          setState(() {
                            selectedLocationItem = value;
                          });
                        },
                        itemBuilder: (context) => <PopupMenuItem<int>>[
                          PopupMenuItem(
                            child: Text(
                                locations[0],
                                style: dropDownMenuItemStyle,
                            ),
                            value: 0,
                          ),
                          PopupMenuItem(
                            child: Text(
                              locations[1],
                              style: dropDownMenuItemStyle,
                            ),
                            value: 1,
                          ),
                        ],
                        child: Row(
                          children: <Widget>[
                            Text(
                                locations[selectedLocationItem],
                              style: dropDownLabelStyle,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      Spacer(), // auto resize with flex
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                    'Where would\nyou want to go?',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(30),
                    child: TextField(
                      style: dropDownMenuItemStyle,
                      controller: TextEditingController(text: locations[1],
                      ),
                      cursorColor: appTheme.primaryColor,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14,),
                        suffixIcon: Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(30),
                          child: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                        )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                        child: ChoiseChip(Icons.flight_takeoff, 'Flights', isFlightSelected),
                      onTap: () {
                          setState(() {
                            isFlightSelected = true;
                          });
                      },
                    ),
                    SizedBox(width: 20,),
                    InkWell(
                      child: ChoiseChip(Icons.hotel, 'Hotels', !isFlightSelected),
                      onTap: () {
                        setState(() {
                          isFlightSelected = false;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ChoiseChip extends StatefulWidget {

  final IconData icon;
  final String text;
  final bool isSelected;
  ChoiseChip(this.icon, this.text, this.isSelected);

  @override
  _ChoiseChipState createState() => _ChoiseChipState();
}

class _ChoiseChipState extends State<ChoiseChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
      decoration: widget.isSelected ? BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ) : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            widget.icon,
            color: Colors.white,
            size: 20,
          ),
          SizedBox(
          width: 8,
          ),
          Text(
              widget.text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}


