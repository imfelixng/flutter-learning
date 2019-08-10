import 'dart:async';
import 'package:flutter/material.dart';

import 'home_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  HomeModel model = HomeModel();

  @override
  void initState() {
    model.getListData();
    super.initState();
  }

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        floatingActionButton: FloatingActionButton(
//            onPressed: () {
//            // We want to refresh, but this actually does nothing. Which is the limitation of future builder
//             _getListData();
//          },
//          child: Icon(
//            Icons.refresh,
//            color: Colors.white,
//        ),
//        ),
//        backgroundColor: Colors.grey[900],
//        body: FutureBuilder(
//          future: _getListData(hasError: false, hasData: true),
//          builder: (buildContext, snapshot) {
//
//            if (snapshot.hasError) {
//              return _getInformationMessage(snapshot.error);
//            }
//
//            if(!snapshot.hasData) {
//              return Center(child: CircularProgressIndicator());
//            }
//
//            var listItems = snapshot.data;
//
//            // When empty data is returned
//            if(listItems.length == 0) {
//              return _getInformationMessage('No data found for your account. Add something and check back.');
//            }
//
//            return ListView.builder(
//                itemCount: listItems.length,
//                itemBuilder: (buildContext, index) => _getListItemUi(index, listItems));
//          },
//        )
//    );
//  }

  Widget _getListItemUi(int index, List<String> listItems) {
    return Container(
      margin: EdgeInsets.all(5.0),
      height: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: Colors.grey[600]),
      child: Center(
        child: Text(
          listItems[index],
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _getInformationMessage(String message) {
    return Center(
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w900, color: Colors.grey[500]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        // We want to refresh, but this actually does nothing. Which is the limitation
        model.getListData();
      },
      child: Icon(
        Icons.refresh,
        color: Colors.white,
      ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
                height: 50,
                width: double.infinity,
                color: Colors.green,
                child: Text('Demo Text')),
            Expanded(
              child: StreamBuilder(
                  stream: model.homeState,
                  builder: (buildContext, snapshot) {

                    if(snapshot.hasError) {
                      return _getInformationMessage(snapshot.error);
                    }

                    // Use busy indicator if there's no state yet, and when it's busy
                    if (!snapshot.hasData || snapshot.data == HomeViewState.Busy) {
                      return Center(child: CircularProgressIndicator());
                    }

                    // use explicit state instead of checking the lenght
                    if(snapshot.data == HomeViewState.NoData) {
                      return _getInformationMessage('No data found for your account. Add something and check back.');
                    }


                    return ListView.builder(
                        itemCount: model.lists.length,
                        itemBuilder: (buildContext, index) => _getListItemUi(index, model.lists));
                  }

              ),
            ),
          ],
        ),
      )
    );
  }
}

