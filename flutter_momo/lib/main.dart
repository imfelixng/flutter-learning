import 'package:flutter/material.dart';
import 'package:momo_payment_plugin/momo_payment_data.dart';
import 'package:momo_payment_plugin/momo_payment_plugin.dart';
import 'package:momo_payment_plugin/momo_payment_result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MomoPaymentResult _momoPaymentResult;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              FlatButton(
                color: Colors.blue,
                child: Text('Payment with momo'),
                onPressed: () async {
                  MomoPaymentData momoPaymentData = MomoPaymentData(
                    appScheme: "momoyx1e20190524",
                    merchantname: "TopThiThu",
                    merchantcode: 'topthithu',
                    amount: 2000,
                    orderId: 'orderId',
                    orderLabel: 'orderLabel',
                    merchantnamelabel: "Top Thi Thử",
                    fee: 200,
                    description: null,
                    requestId: 'requestId',
                    partnerCode: 'MOMOYX1E20190524',
                  );

                  MomoPaymentResult momoPaymentResult =
                  await MomoPaymentPlugin().requestPayment(momoPaymentData);

                  setState(() {
                    _momoPaymentResult = momoPaymentResult;
                  });
                },
              ),
              Text('Phone'),
              Text(_momoPaymentResult?.phonenumber ?? ''),
              Text('Token'),
              Text(_momoPaymentResult?.token ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}