import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Màn hình hiển thị thông báo đơn hàng thành công
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Successfull Order",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            IconButton(
              iconSize: 32,
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
            Text("Go back to Home", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
