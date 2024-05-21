

import 'package:flutter/material.dart';
import 'package:stock_app/domain/repository/stock_repository.dart';
import 'package:stock_app/presentation/company_info/company_info_state.dart';

class CompanyInfoViewModel with ChangeNotifier {
  CompanyInfoViewModel(this.repository, String symbol) {
    loadCompanyInfo(symbol);
  }

  final StockRepository repository;

  var _state = const CompanyInfoState();

// Getter Setter =============================================================================
  CompanyInfoState get state => _state;

// Method =============================================================================

  Future<void> loadCompanyInfo(String symbol) async {
    _state = state.copyWith(isLoading: false);
    notifyListeners();

    final result = await repository.getCompanyInfo(symbol: symbol);
    result.when(
      success: (info) {
        _state = state.copyWith(
          companyInfo: info,
          isLoading: false,
          errorMessage: null,
        );
      },
      error: (e) {
        _state = state.copyWith(
          companyInfo: null,
          isLoading: false,
          errorMessage: e.toString(),
        );
      },
    );

    notifyListeners();
  }
}