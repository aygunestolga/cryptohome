import 'package:flutter/material.dart';

class CoinModel{
  CoinModel({
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
    required this.change,
    required this.changePercentage
  });

  String? name;
  String? symbol;
  String? imageUrl;
  num? price;
  num? change;
  num? changePercentage;

  factory CoinModel.fromJson(Map<String, dynamic> json){
    return CoinModel(
      name: json['name'],
      symbol: json['symbol'],
      imageUrl: json['image'],
      price: json['current_price'],
      change: json['price_change_24h'],
      changePercentage: json['price_change_percentage_24h'],
    );
  }
}

List<CoinModel> coinList = [];