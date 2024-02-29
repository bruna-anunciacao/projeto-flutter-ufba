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
    final marketCap = crypto['market_cap'];
    final volume = crypto['total_volume'];
    final rank = crypto['market_cap_rank'];
    final lastUpdated = crypto['last_updated'];

    return Scaffold(
      backgroundColor: Color.fromARGB(250, 0, 62, 105),
      appBar: AppBar(
        backgroundColor: const Color(0xFF012A4A),
        foregroundColor: Colors.white,
        title: Text('Detalhes - $name'),
      ),
      body: Center(
        child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center, 
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              image,
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 20),
            Text(
              '$name - ($symbol)',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Preço: R\$ $price',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Variação: $change%',
              style: TextStyle(
                fontSize: 18,
                color: change > 0 ? Colors.green : Colors.red,
              ),
            ),
          Container(
                decoration: BoxDecoration(
                color: const Color.fromARGB(42,111,151, 151), // Cor de destaque
                borderRadius: BorderRadius.circular(8.0), // Borda arredondada
              ),
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              child: ListTile(
                  textColor: Colors.white,
                  // leading: Image.network(image),
                  title: Text(
                  'Posição no rank: $rankº ',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              ),
              Container(
                decoration: BoxDecoration(
                color: const Color.fromARGB(42,111,151, 151), // Cor de destaque
                borderRadius: BorderRadius.circular(8.0), // Borda arredondada
              ),
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              child: ListTile(
                  textColor: Colors.white,
                  // leading: Image.network(image),
                  title: Text(
                  'Capitalização de mercado: $marketCap',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              ),
              Container(
                decoration: BoxDecoration(
                color: const Color.fromARGB(42,111,151, 151), // Cor de destaque
                borderRadius: BorderRadius.circular(8.0), // Borda arredondada
              ),
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              child: ListTile(
                  textColor: Colors.white,
                  // leading: Image.network(image),
                  title: Text(
                  'Volume de negociação: $volume ',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Text(
              'Variação: $lastUpdated%',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    )
    );
  }
}
