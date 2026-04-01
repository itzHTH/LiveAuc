import 'package:street_auction/main_common.dart';
import 'package:street_auction/flavors/flavors_config.dart';

void main() {
  mainCommon(
    flavor: Flavor.production,
    appName: "Street Auction",
    baseUrl: "https://apiservice.ddns.net",
  );
}
