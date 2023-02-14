import 'dart:convert';

import 'package:deneme1/model/coinModel.dart';
import 'package:http/http.dart' as http;

class CoinService {
    final String baseUrl=
    'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false';
    Future<CoinModel?> getCoins() async{
    var response = await http.get(Uri.parse(baseUrl));
    if(response.statusCode == 200){
      var jsonbody = CoinModel.fromJson(jsonDecode(response.body));
      return jsonbody;
    }else{
      print("request is failed");
    }
  }
}

