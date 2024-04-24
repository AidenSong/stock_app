import 'package:http/http.dart' as http;




class StockAPI {

  static const String baseURL = "https://alphvantage.co";
  static const String apiKey = "XHY5Y4X4JUX66SOO";


  final http.Client client;

  StockAPI(this.client);

  Future<http.Response> getListings(String apiKey) async {
    return await client
        .get(Uri.parse("https://www.alphavantage.co/query?function=LISTING_STATUS&apikey=$apiKey"));
  }
}