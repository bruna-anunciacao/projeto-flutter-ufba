import 'dart:convert';

import 'package:crypto/crypto_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=brl&order=market_cap_desc&per_page=50&page=1&sparkline=false'));
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
    } else {
      throw Exception('Falha ao carregar criptomoedas');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF012A4A),
      appBar: AppBar(
        title: const Text('Crypto'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 10,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          if (index >= data.length) {
            return const CircularProgressIndicator(); // ou qualquer outro widget de carregamento
          }
          final crypto = data[index];
          final name = crypto['name'];
          final symbol = crypto['symbol'];
          final image = crypto['image'];
          final price = crypto['current_price'];
          // final change = crypto['price_change_percentage_24h'];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CryptoDetailsScreen(crypto: crypto),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
              color: const Color.fromARGB(42,111,151, 151), // Cor de destaque
              borderRadius: BorderRadius.circular(8.0), // Borda arredondada
            ),
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            child: ListTile(
                textColor: Colors.white,
                // backgroundColor: Color.fromARGB(255, 3, 29, 49),
                leading: Image.network(image),
                title: Text(
                  '$name - $symbol',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Text(
                  'R\$ $price',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )),
            )
          );
        },
      ),
    );
  }
}
