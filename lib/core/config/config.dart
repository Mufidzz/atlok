class URL {
  static const _url = "http://192.168.1.15:50006";
  static const Login = "$_url/auth/login";
  static const Register = "$_url/auth/register";
  static const CreateCustomer = "$_url/customer/";
  static const CreateSubstation = "$_url/substation/";
  static const CreatePowerRate = "$_url/power-rating/";

  // ignore: non_constant_identifier_names
  static SearchCustomer(String param, int start, int count, {ext = ""}) =>
      "$_url/customer/$param/search/$start/$count?$ext";

  // ignore: non_constant_identifier_names
  static SearchSubstation(String param, int start, int count) =>
      "$_url/substation/$param/search/$start/$count";

  // ignore: non_constant_identifier_names
  static DeleteSubstation(String id) => "$_url/substation/$id";

  // ignore: non_constant_identifier_names
  static UpdateSubstation(String id) => "$_url/substation/$id";

  // ignore: non_constant_identifier_names
  static UpdatePowerRate(String id) => "$_url/power-rating/$id";

  // ignore: non_constant_identifier_names
  static SearchPowerRate(String param, int start, int count) =>
      "$_url/power-rating/$param/search/$start/$count";

  // ignore: non_constant_identifier_names
  static GetCustomerChange(int start, int count) =>
      "$_url/customer-change/$start/$count";

  // ignore: non_constant_identifier_names
  static GetUnverifiedUsers(int start, int count) =>
      "$_url/user/unverified/$start/$count";

  // ignore: non_constant_identifier_names
  static VerifyUser(String id) => "$_url/user/verify/$id";
}

class SPKey {
  static const token = "zS21SAdweaEasekjh123WE";
  static const access = "da23Aw1EqQxX21d";
}
