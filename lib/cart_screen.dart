import 'package:flutter/material.dart';
import 'splash_screen.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _quantity = 1;
  String _paymentMethod = "Credit Card";
  final List<String> _paymentOptions = ["Credit Card", "Paypal", "Cash"];

  void _increaseQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decreaseQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  void _confirmOrder(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SplashScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Nền trắng theo theme
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Cart",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Divider(thickness: 1, height: 20),
            // Sản phẩm mẫu
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.image,
                        size: 40,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Product Name", style: TextStyle(fontSize: 18)),
                          SizedBox(height: 8),
                          Text(
                            "$_quantity",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Nút tăng giảm số lượng
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove_circle_outline),
                          onPressed: _decreaseQuantity,
                        ),
                        Text("$_quantity", style: TextStyle(fontSize: 16)),
                        IconButton(
                          icon: Icon(Icons.add_circle_outline),
                          onPressed: _increaseQuantity,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Payment method với DropdownButton
            Text(
              "Payment Method:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                value: _paymentMethod,
                isExpanded: true,
                underline: SizedBox(),
                items:
                    _paymentOptions.map((method) {
                      return DropdownMenuItem<String>(
                        value: method,
                        child: Text(method, style: TextStyle(fontSize: 16)),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    _paymentMethod = value!;
                  });
                },
              ),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text("Confirm Order", style: TextStyle(fontSize: 18)),
                onPressed: () => _confirmOrder(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
