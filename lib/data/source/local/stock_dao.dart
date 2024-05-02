import 'package:hive/hive.dart';
import 'package:stock_app/data/source/local/company_listing_entity.dart';



class StockDao {
  static const COMPANY_LISTING = "companyListing";

  // 추가
  Future<void> insertCompanyListings(List<CompanyListingEntities> companyListingEntity) async {
    final box = await Hive.openBox<CompanyListingEntities>('stock.db');
    await box.addAll(companyListingEntity);
  }

  // 클리어
  Future clearCompanyListings() async {
    final box = await Hive.openBox<CompanyListingEntities>('stock.db');
    await box.clear();
  }

  // 검색
  Future<List<CompanyListingEntities>> searchCompanyListing(String query) async {
    final box = await Hive.openBox<CompanyListingEntities>('stock.db');
    final List<CompanyListingEntities> companyListing = box.values.toList();
    return companyListing
        .where((e) => e.name.toLowerCase().contains(query.toLowerCase())
          || query.toUpperCase() == e.symbol)
        .toList();
  }
}