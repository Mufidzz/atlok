import 'package:atlok/core/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';

class UCAdminDashboard {
  static void goToFindSubstation() {
    ExtendedNavigator.root.push(Routes.vFindSubstationData);
  }

  static void goToFindCustomer() {
    ExtendedNavigator.root
        .pushAndRemoveUntil(Routes.vFindCustomerData, (r) => false);
  }

  static void goToFindPowerRates() {
    ExtendedNavigator.root.push(Routes.vFindPowerRates);
  }

  static void goToCustomerChangeVerification() {
    ExtendedNavigator.root.push(Routes.vCustomerDataChangeVerification);
  }

  static void goToNewUserVerification() {
    ExtendedNavigator.root.push(Routes.vUserRegisterVerification);
  }
}
