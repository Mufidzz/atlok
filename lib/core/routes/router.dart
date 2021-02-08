import 'package:atlok/features/admin_dashboard/views/v.admin_dashboard.dart';
import 'package:atlok/features/auth/views/v.login.dart';
import 'package:atlok/features/auth/views/v.register.dart';
import 'package:atlok/features/customer_data/views/v.customer_data_change_request.dart';
import 'package:atlok/features/customer_data/views/v.customer_data_detail.dart';
import 'package:atlok/features/customer_data/views/v.customer_data_form.dart';
import 'package:atlok/features/customer_data/views/v.find_customer_data.dart';
import 'package:atlok/features/power_rates_data/views/v.find_power_rates.dart';
import 'package:atlok/features/power_rates_data/views/v.power_rates_form.dart';
import 'package:atlok/features/substation_data/views/v.find_substation_data.dart';
import 'package:atlok/features/substation_data/views/v.substation_data_detail.dart';
import 'package:atlok/features/substation_data/views/v.substation_data_form.dart';
import 'package:atlok/features/user_data/views/v.manage_user.dart';
import 'package:atlok/features/verification/views/v.customer_data_change_verification.dart';
import 'package:atlok/features/verification/views/v.user_register_verification.dart';
import 'package:auto_route/auto_route_annotations.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: VAdminDashboard, path: "/admin/dashboard"),
  MaterialRoute(page: VLogin, path: "/auth/login"),
  MaterialRoute(page: VRegister, path: "/auth/register"),
  MaterialRoute(page: VCustomerDataChangeRequest, path: "/cdc"),
  MaterialRoute(page: VCustomerDataDetail, path: "/cdd"),
  MaterialRoute(page: VCustomerDataForm, path: "/cdf"),
  MaterialRoute(page: VFindCustomerData, path: "/fcd", initial: true),
  MaterialRoute(page: VFindPowerRates, path: "/fpr"),
  MaterialRoute(page: VPowerRatesForm, path: "/prf"),
  MaterialRoute(page: VFindSubstationData, path: "/fsd"),
  MaterialRoute(page: VSubstationDataDetail, path: "/sdd"),
  MaterialRoute(page: VSubstationDataForm, path: "/sdf"),
  MaterialRoute(page: VManageUser, path: "/mu"),
  MaterialRoute(page: VCustomerDataChangeVerification, path: "/cdcv"),
  MaterialRoute(page: VUserRegisterVerification, path: "/urv"),
])
class $RViews {}
