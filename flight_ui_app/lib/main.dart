import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'CustomAppBar.dart';
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
  fontSize: 16,
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
      bottomNavigationBar: CustomAppBar(),
      body: Column(
        children: <Widget>[
          HomeScreenTopPart(),
          homeScreenBottomPart,
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
                      fontWeight: FontWeight.w600),
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
                      controller: TextEditingController(
                        text: locations[1],
                      ),
                      cursorColor: appTheme.primaryColor,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          suffixIcon: Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(30),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      child: ChoiseChip(
                          Icons.flight_takeoff, 'Flights', isFlightSelected),
                      onTap: () {
                        setState(() {
                          isFlightSelected = true;
                        });
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      child:
                          ChoiseChip(Icons.hotel, 'Hotels', !isFlightSelected),
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
      decoration: widget.isSelected
          ? BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            )
          : null,
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

var viewAllStyle = TextStyle(
  fontSize: 14,
  color: appTheme.primaryColor,
);

var homeScreenBottomPart = Container(
  child: Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Currently watched Items",
              style: dropDownMenuItemStyle,
            ),
            Spacer(),
            Text(
              "VIEW ALL(12)",
              style: viewAllStyle,
            ),
          ],
        ),
      ),
      Container(
        height: 270,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: cityCards,
        ),
      )
    ],
  ),
);

List<CityCard> cityCards = [
  CityCard('assets/images/lasvegas.jpg', 'Las vegas', 'Feb 2019', '45', '4299',
      '3999'),
  CityCard(
      'assets/images/athens.jpg', 'Athens', 'Apr 2019', '50', '5000', '3800'),
  CityCard(
      'assets/images/sydney.jpeg', 'Sydney', 'Dec 2018', '40', '3299', '2999'),
];

final formatCurrency = NumberFormat.simpleCurrency();

class CityCard extends StatelessWidget {
  final String imagePath, city, monthYear, discount, oldPrice, newPrice;

  const CityCard(this.imagePath, this.city, this.monthYear, this.discount,
      this.oldPrice, this.newPrice);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            child: Stack(
              children: <Widget>[
                Container(
                  height: 240,
                  width: 160,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  width: 160,
                  height: 60,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black,
                          Colors.black.withOpacity(0.1),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 10,
                  right: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            city,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            monthYear,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "$discount%",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 5,
              ),
              Text(
                '\$$newPrice',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '(\$$oldPrice)',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
