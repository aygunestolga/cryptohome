import 'dart:convert';

import 'package:deneme1/service/CoinService.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model/coinModel.dart';
import 'widget/CoinCard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool? isLoading;
  CoinService coinService = CoinService();

  @override
  void initState() {
    super.initState();
    coinService.getCoins().then((value) {
      if(value != null ){
        setState(() {
          coinList = value.name as List<CoinModel>;
          isLoading = true;
        });
      }else{
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Center(
          child: Text(
              'CryptoRoom',
            style: TextStyle(
              color: Colors.grey[900],
              fontSize: 26,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
          itemCount: coinList.length,
          itemBuilder: (context, index){
          return CoinCard(
              name: coinList[index].name,
              symbol: coinList[index].symbol,
              imageUrl: coinList[index].imageUrl,
              price: coinList[index].price!.toDouble(),
              change: coinList![index].change!.toDouble(),
              changePercentage: coinList[index].changePercentage!.toDouble()
          );
        }),
    );
  }
}

