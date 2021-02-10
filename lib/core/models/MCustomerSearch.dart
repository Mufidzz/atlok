import 'package:atlok/core/models/MCustomer.dart';

class MCustomerSearch {
  final int nextOffset;
  final List<MCustomer> customers;

  MCustomerSearch({this.nextOffset, this.customers});
}
