import 'package:atlok/core/routes/routes.dart';
import 'package:auto_route/auto_route.dart';

class UCFindCustomerData {
  static void goToCustomerDataForm() {
    ExtendedNavigator.root.push(Routes.vCustomerDataForm);
  }
}
