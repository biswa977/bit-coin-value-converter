import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';


const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];


const coinAPIURL= 'https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC';
const coinAPIURL2= 'https://apiv2.bitcoinaverage.com/indices/global/ticker/ETH';
const coinAPIURL3= 'https://apiv2.bitcoinaverage.com/indices/global/ticker/LTC';
const apiKey = 'YWI3NjRkNmIyM2RkNDZmYzkxY2IzN2Q2MjYwZjcwNzg';


class CoinData {

  
  Map<String,String> _headers = {
      HttpHeaders.acceptHeader : 'application/json',
      'x-ba-key' : apiKey
  };

  Future getCoinData(String selectedCurrency) async{

      http.Response response = await http.get("$coinAPIURL$selectedCurrency", headers: _headers);

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['last'];
      
      return lastPrice;
    } else {
      print(response.statusCode);
      throw 'problem with requesting api';
    }

  }
  Future getCoinData2(String selectedCurrency) async{

      http.Response response = await http.get("$coinAPIURL2$selectedCurrency", headers: _headers);

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice2 = decodedData['last'];
      
      return lastPrice2;
    } else {
      print(response.statusCode);
      throw 'problem with requesting api';
    }

  }
  Future getCoinData3(String selectedCurrency) async{

      http.Response response = await http.get("$coinAPIURL3$selectedCurrency", headers: _headers);

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice3 = decodedData['last'];
      
      return lastPrice3;
    } else {
      print(response.statusCode);
      throw 'problem with requesting api';
    }

  }

 
}
