import '../utils/api/implementation/simple_api/simple_params.dart';

class ConfigParams extends SimpleParameters {
  String get address1 => body["address1"];
  set address1(String val) {
    super.queryParams["address1"] = val;
  }

  String get address2 => body["address2"];
  set address2(String val) {
    super.queryParams["address2"] = val;
  }

  String get vehicle => body["vehicle"];
  set vehicle(String val) {
    super.queryParams["vehicle"] = val;
  }
}
