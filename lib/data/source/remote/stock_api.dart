import 'package:http/http.dart' as http;




class StockAPI {

  static const String baseURL = "https://alphvantage.co";
  static const String apiKey = "XHY5Y4X4JUX66SOO";


  final http.Client _client;

  StockAPI({http.Client? client}) : _client = (client ?? http.Client());

  Future<http.Response> getListings({String apiKey = apiKey}) async {
    return await _client
        .get(Uri.parse("https://www.alphavantage.co/query?function=LISTING_STATUS&apikey=$apiKey"));
  }
}