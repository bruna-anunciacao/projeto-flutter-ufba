import 'package:flutter/material.dart';

class CryptoDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> crypto;

  CryptoDetailsScreen({required this.crypto});

  @override
  Widget build(BuildContext context) {
    final name = crypto['name'];
    final symbol = crypto['symbol'];
    final image = crypto['image'];
    final price = crypto['current_price'];
    final change = crypto['price_change_percentage_24h'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes - $name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              image,
              height: 100,
              width: 100,
            ),
            SizedBox(height: 20),
            Text(
              '$name - ($symbol)',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Preço: R\$ $price',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Variação: $change%',
              style: TextStyle(
                fontSize: 18,
                color: change > 0 ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
