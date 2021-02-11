// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/admin_dashboard/views/v.admin_dashboard.dart';
import '../../features/auth/views/v.login.dart';
import '../../features/auth/views/v.register.dart';
import '../../features/customer_data/views/v.customer_data_change_request.dart';
import '../../features/customer_data/views/v.customer_data_detail.dart';
import '../../features/customer_data/views/v.customer_data_form.dart';
import '../../features/customer_data/views/v.find_customer_data.dart';
import '../../features/power_rates_data/views/v.find_power_rates.dart';
import '../../features/power_rates_data/views/v.power_rates_form.dart';
import '../../features/substation_data/views/v.find_substation_data.dart';
import '../../features/substation_data/views/v.substation_data_detail.dart';
import '../../features/substation_data/views/v.substation_data_form.dart';
import '../../features/user_data/views/v.manage_user.dart';
import '../../features/verification/views/v.customer_data_change_verification.dart';
import '../../features/verification/views/v.user_register_verification.dart';
import '../models/MCustomer.dart';
import '../models/MPowerRate.dart';
import '../models/MSubstation.dart';

class Routes {
  static const String vAdminDashboard = '/admin/dashboard';
  static const String vLogin = '/auth/login';
  static const String vRegister = '/auth/register';
  static const String vCustomerDataChangeRequest = '/cdc';
  static const String vCustomerDataDetail = '/cdd';
  static const String vCustomerDataForm = '/cdf';
  static const String vFindCustomerData = '/fcd';
  static const String vFindPowerRates = '/fpr';
  static const String vPowerRatesForm = '/prf';
  static const String vFindSubstationData = '/fsd';
  static const String vSubstationDataDetail = '/sdd';
  static const String vSubstationDataForm = '/sdf';
  static const String vManageUser = '/mu';
  static const String vCustomerDataChangeVerification = '/cdcv';
  static const String vUserRegisterVerification = '/urv';
  static const all = <String>{
    vAdminDashboard,
    vLogin,
    vRegister,
    vCustomerDataChangeRequest,
    vCustomerDataDetail,
    vCustomerDataForm,
    vFindCustomerData,
    vFindPowerRates,
    vPowerRatesForm,
    vFindSubstationData,
    vSubstationDataDetail,
    vSubstationDataForm,
    vManageUser,
    vCustomerDataChangeVerification,
    vUserRegisterVerification,
  };
}

class RViews extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.vAdminDashboard, page: VAdminDashboard),
    RouteDef(Routes.vLogin, page: VLogin),
    RouteDef(Routes.vRegister, page: VRegister),
    RouteDef(Routes.vCustomerDataChangeRequest,
        page: VCustomerDataChangeRequest),
    RouteDef(Routes.vCustomerDataDetail, page: VCustomerDataDetail),
    RouteDef(Routes.vCustomerDataForm, page: VCustomerDataForm),
    RouteDef(Routes.vFindCustomerData, page: VFindCustomerData),
    RouteDef(Routes.vFindPowerRates, page: VFindPowerRates),
    RouteDef(Routes.vPowerRatesForm, page: VPowerRatesForm),
    RouteDef(Routes.vFindSubstationData, page: VFindSubstationData),
    RouteDef(Routes.vSubstationDataDetail, page: VSubstationDataDetail),
    RouteDef(Routes.vSubstationDataForm, page: VSubstationDataForm),
    RouteDef(Routes.vManageUser, page: VManageUser),
    RouteDef(Routes.vCustomerDataChangeVerification,
        page: VCustomerDataChangeVerification),
    RouteDef(Routes.vUserRegisterVerification, page: VUserRegisterVerification),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    VAdminDashboard: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => VAdminDashboard(),
        settings: data,
      );
    },
    VLogin: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => VLogin(),
        settings: data,
      );
    },
    VRegister: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => VRegister(),
        settings: data,
      );
    },
    VCustomerDataChangeRequest: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => VCustomerDataChangeRequest(),
        settings: data,
      );
    },
    VCustomerDataDetail: (data) {
      final args = data.getArgs<VCustomerDataDetailArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => VCustomerDataDetail(
          key: args.key,
          customer: args.customer,
        ),
        settings: data,
      );
    },
    VCustomerDataForm: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => VCustomerDataForm(),
        settings: data,
      );
    },
    VFindCustomerData: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => VFindCustomerData(),
        settings: data,
      );
    },
    VFindPowerRates: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => VFindPowerRates(),
        settings: data,
      );
    },
    VPowerRatesForm: (data) {
      final args = data.getArgs<VPowerRatesFormArguments>(
        orElse: () => VPowerRatesFormArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => VPowerRatesForm(
          key: args.key,
          powerRate: args.powerRate,
        ),
        settings: data,
      );
    },
    VFindSubstationData: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => VFindSubstationData(),
        settings: data,
      );
    },
    VSubstationDataDetail: (data) {
      final args = data.getArgs<VSubstationDataDetailArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => VSubstationDataDetail(
          key: args.key,
          substation: args.substation,
        ),
        settings: data,
      );
    },
    VSubstationDataForm: (data) {
      final args = data.getArgs<VSubstationDataFormArguments>(
        orElse: () => VSubstationDataFormArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => VSubstationDataForm(
          key: args.key,
          substation: args.substation,
        ),
        settings: data,
      );
    },
    VManageUser: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => VManageUser(),
        settings: data,
      );
    },
    VCustomerDataChangeVerification: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => VCustomerDataChangeVerification(),
        settings: data,
      );
    },
    VUserRegisterVerification: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => VUserRegisterVerification(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// VCustomerDataDetail arguments holder class
class VCustomerDataDetailArguments {
  final Key key;
  final MACustomer customer;
  VCustomerDataDetailArguments({this.key, @required this.customer});
}

/// VPowerRatesForm arguments holder class
class VPowerRatesFormArguments {
  final Key key;
  final MPowerRate powerRate;
  VPowerRatesFormArguments({this.key, this.powerRate});
}

/// VSubstationDataDetail arguments holder class
class VSubstationDataDetailArguments {
  final Key key;
  final MSubstation substation;
  VSubstationDataDetailArguments({this.key, @required this.substation});
}

/// VSubstationDataForm arguments holder class
class VSubstationDataFormArguments {
  final Key key;
  final MSubstation substation;
  VSubstationDataFormArguments({this.key, this.substation});
}
