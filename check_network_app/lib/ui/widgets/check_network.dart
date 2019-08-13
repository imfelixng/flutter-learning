import 'package:flutter/material.dart';
import 'package:network_aware/enums/connectivity_status.dart';
import 'package:provider/provider.dart';

class CheckNetWork extends StatelessWidget {
  final Widget child;
  CheckNetWork({ this.child });

  @override
  Widget build(BuildContext context) {

    var connectionStatus = Provider.of<ConnectivityStatus>(context);

    return Container(
      constraints: BoxConstraints.expand(),
      child: Stack(
        children: <Widget>[
          child,
          connectionStatus == ConnectivityStatus.Offline ? Positioned(
            top: 0,
            left: 0,
            child: Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    print('aaa');
          },
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    color: Colors.red,
                    child: Center(
                      child: Text(
                        'No connect network...',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ) : Container(),
        ],
      ),
    );
  }
}
