import 'package:street_auction/main_common.dart';
import 'package:street_auction/flavors/flavors_config.dart';

void main() {
  mainCommon(
    flavor: Flavor.development,
    appName: "Street Auction Development",
    baseUrl: "https://apiservice.ddns.net",
  );
}
