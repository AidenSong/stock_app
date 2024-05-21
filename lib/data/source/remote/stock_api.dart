import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stock_app/data/source/remote/dto/company_info_dto.dart';
import 'package:stock_app/domain/model/company_info.dart';




class StockAPI {

  static const String baseURL = "https://alphvantage.co";
  static const String apiKey = "XHY5Y4X4JUX66SOO";


  final http.Client _client;

  StockAPI({http.Client? client}) : _client = (client ?? http.Client());

  Future<http.Response> getListings({String apiKey = apiKey}) async {
    return await _client
        .get(Uri.parse("$baseURL/query?function=LISTING_STATUS&apikey=$apiKey"));
  }

  Future<CompanyInfoDto> getCompanyInfo({
    required String symbol,
    String apiKey = apiKey
  }) async {
    final response =  await _client
        .get(Uri.parse("$baseURL/query?function=OVERVIEW&symbol=$symbol&apikey=$apiKey"));

    return CompanyInfoDto.fromJson(jsonDecode(response.body));
  }
}