import 'dart:convert';
import 'package:http/http.dart' as http;

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
const API_URL = 'https://rest.coinapi.io/v1/exchangerate';
const API_KEY = "6E363B5A-8D4A-46E9-A8CD-6DC0D5EE928F";

class CoinData {
  Map<String, String> cryptoPrices = {};
  Future getCoinData(String selectedCurrency) async {
    for (String crypto in cryptoList) {
      http.Response response = await http
          .get(Uri.parse('$API_URL/$crypto/$selectedCurrency?apikey=$API_KEY'));
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double lastPrice = decodedData['rate'];
        cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}
