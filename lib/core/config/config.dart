class URL {
  // static const _url = "https://atlok.ofcode.dev/api";
  static const _url = "http://192.168.1.15:50006";
  static const Login = "$_url/auth/login";
  static const Register = "$_url/auth/register";
  static const CreateCustomer = "$_url/customer/";
  static const CreateSubstation = "$_url/substation/";
  static const CreatePowerRate = "$_url/power-rating/";
  static const CreateFare = "$_url/fares/";

  // ignore: non_constant_identifier_names
  static SearchCustomer(String param, int start, int count,
          {List<String> ext}) =>
      "$_url/customer/${param == "" ? "-" : param}/search/$start/$count?${ext != null ? ext.join("&") : ""}";

  // ignore: non_constant_identifier_names
  static SearchSubstation(String param, int start, int count) =>
      "$_url/substation/${param == "" ? "-" : param}/search/$start/$count";

  // ignore: non_constant_identifier_names
  static CreateCustomerChange(String id) => "$_url/customer-change/$id";

  // ignore: non_constant_identifier_names
  static DeleteSubstation(String id) => "$_url/substation/$id";

  // ignore: non_constant_identifier_names
  static UpdateSubstation(String id) => "$_url/substation/$id";

  // ignore: non_constant_identifier_names
  static UpdatePowerRate(String id) => "$_url/power-rating/$id";

  // ignore: non_constant_identifier_names
  static UpdateFare(String id) => "$_url/fares/$id";

  // ignore: non_constant_identifier_names
  static UpdateCustomer(String id) => "$_url/customer/$id";

  // ignore: non_constant_identifier_names
  static DeleteCustomer(String id) => "$_url/customer/$id";

  // ignore: non_constant_identifier_names
  static SearchPowerRate(String param, int start, int count) =>
      "$_url/power-rating/${param == "" ? "-" : param}/search/$start/$count";
  // ignore: non_constant_identifier_names
  static SearchFares(String param, int start, int count) =>
      "$_url/fares/${param == "" ? "-" : param}/search/$start/$count";

  // ignore: non_constant_identifier_names
  static GetCustomerChange(int start, int count) =>
      "$_url/customer-change/$start/$count";

  // ignore: non_constant_identifier_names
  static GetCustomer(String id) => "$_url/customer/$id";

  // ignore: non_constant_identifier_names
  static PatchCustomerChange(String id, bool accepted) =>
      "$_url/customer-change/$id/${accepted ? "accept" : "deny"}";

  // ignore: non_constant_identifier_names
  static GetUnverifiedUsers(int start, int count) =>
      "$_url/user/unverified/$start/$count";

  // ignore: non_constant_identifier_names
  static VerifyUser(String id) => "$_url/user/verify/$id";
  // ignore: non_constant_identifier_names
  static DeleteUser(String id) => "$_url/user/$id";
}

class SPKey {
  static const token = "zS21SAdweaEasekjh123WE";
  static const access = "da23Aw1EqQxX21d";
}
