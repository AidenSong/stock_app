import 'package:hive/hive.dart';


part 'company_listing_entity.g.dart';

@HiveType(typeId: 0)
class CompanyListingEntities extends HiveObject {
  CompanyListingEntities({
    required this.symbol,
    required this.name,
    required this.exchange,
  });

  @HiveField(0)
  String symbol;

  @HiveField(1)
  String name;

  @HiveField(2)
  String exchange;
}