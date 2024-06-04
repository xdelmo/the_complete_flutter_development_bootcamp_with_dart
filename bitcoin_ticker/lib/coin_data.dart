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

const API_KEY = "6E363B5A-8D4A-46E9-A8CD-6DC0D5EE928F";

class CoinData {
  CoinData({required this.selectedCurrency});
  String selectedCurrency = "USD";

  Future getCoinData() async {
    http.Response response = await http.get(Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/BTC/$selectedCurrency?apikey=$API_KEY'));

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      var lastPrice = decodedData['rate'];
      // print(data);
      return lastPrice;
    } else {
      print(response.statusCode);
    }
  }
}
