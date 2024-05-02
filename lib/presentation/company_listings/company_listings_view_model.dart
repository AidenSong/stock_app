import 'package:flutter/cupertino.dart';
import 'package:stock_app/domain/repository/stock_repository.dart';
import 'package:stock_app/presentation/company_listings/company_listings_state.dart';

class CompanyListingsViewModel with ChangeNotifier{
  CompanyListingsViewModel(this._repository) {
    _getCompanyListings();
  }

  final StockRepository _repository;

  var _state = CompanyListingsState();

  CompanyListingsState get state => _state;

  Future _getCompanyListings({
    bool fetchFromRemote = false,
    String query = "",
  }) async {
    _state = state.copyWith(
      isLoading: true,
    );
    notifyListeners();

    final result = await _repository.getCompanyListings(fetchFromRemote, query);
    result.when(
      success: (listings) {
        _state = state.copyWith(
          companies: listings,
        );
      },
      error: (e) {
        // TODO : 에러 처리
        print("리모트 에러 : ${e.toString()}");
      },
    );

    _state = state.copyWith(
      isLoading: false,
    );
    notifyListeners();
  }
}