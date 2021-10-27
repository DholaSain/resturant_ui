import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCode extends StatelessWidget {
  const QRCode({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      child: Center(
        child: QrImage(data: 'MRsBaovyWkTXCLa95d2vMcymLjw1',
        size: 250,),
      ),  
      ),
    );
  }
}