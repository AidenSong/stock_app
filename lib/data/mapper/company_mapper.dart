import 'package:stock_app/data/source/local/company_listing_entity.dart';
import 'package:stock_app/domain/model/company_listing.dart';

extension ToCompanyListing on CompanyListingEntities {
  CompanyListing toCompanyListing() {
    return CompanyListing(
      symbol: symbol,
      name: name,
      exchange: exchange,
    );
  }
}

extension ToCompanyListingEntity on CompanyListing {
  CompanyListingEntities toCompanyListingEntity() {
    return CompanyListingEntities(
      symbol: symbol,
      name: name,
      exchange: exchange,
    );
  }
}