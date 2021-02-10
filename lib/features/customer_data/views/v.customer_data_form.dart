import 'package:atlok/core/models/MCustomer.dart';
import 'package:atlok/core/models/MDropdown.dart';
import 'package:atlok/core/models/MPowerRate.dart';
import 'package:atlok/core/models/MSubstation.dart';
import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/utilities/UShowDialog.dart';
import 'package:atlok/core/widgets/WDropdownWrapper.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:atlok/features/customer_data/usecases/u.customer_data_form.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class VCustomerDataForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WSafeArea(
      color: TColors.primary,
      child: Scaffold(
        body: Column(
          children: [
            AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_outlined),
                onPressed: () {
                  ExtendedNavigator.root.pop();
                },
              ),
              backgroundColor: TColors.primary,
              title: Text(
                "Buat Data Pelanggan",
                style: TTextStyle.medium(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    TSpacing * 6,
                    TSpacing * 4,
                    TSpacing * 6,
                    0,
                  ),
                  child: CustomerForm(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomerForm extends StatefulWidget {
  const CustomerForm({
    Key key,
  }) : super(key: key);

  @override
  _CustomerFormState createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  GlobalKey<FormState> _formKey;
  MCustomer _customer;
  MDropdown<MSubstation> _dsSubstation = new MDropdown();
  MDropdown<MPowerRate> _dsPowerRate = new MDropdown();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formKey = GlobalKey<FormState>();
    _customer = new MCustomer();
    _dsSubstation = new MDropdown<MSubstation>(values: [
      new MSubstation(iD: 1, name: "Hello"),
      new MSubstation(iD: 2, name: "Hello2"),
      new MSubstation(iD: 3, name: "Hello3"),
    ]);
    _dsPowerRate = new MDropdown<MPowerRate>(values: [
      new MPowerRate(iD: 1, name: "Hello"),
      new MPowerRate(iD: 2, name: "Hello2"),
    ]);

    _dsSubstation.selectedValue = _dsSubstation.values.first;
    _dsPowerRate.selectedValue = _dsPowerRate.values.first;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: this._formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Data Pelanggan",
            style: TTextStyle.medium(
              color: TColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          VSpacing(TSpacing * 2),
          WTextField(
            icon: Icons.workspaces_outline,
            labelText: "ID Pelanggan",
            required: true,
            onChanged: (String v) {
              this._customer.iDPEL = v;
            },
          ),
          WTextField(
            icon: Icons.person_outline,
            labelText: "Nama Lengkap",
            required: true,
            onChanged: (String v) {
              this._customer.fullName = v;
            },
          ),
          WTextField(
            icon: Icons.home_outlined,
            labelText: "Alamat Lengkap",
            required: true,
            onChanged: (String v) {
              this._customer.address = v;
            },
          ),
          VSpacing(TSpacing * 3),
          Text(
            "Data Teknis",
            style: TTextStyle.medium(
              color: TColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          VSpacing(TSpacing * 2),
          WTextField(
            icon: Icons.title,
            labelText: "Nomor Tiang",
            required: true,
            onChanged: (String v) {
              this._customer.poleNumber = v;
            },
          ),
          WDropdownWrapper(
            prefixIcon: Icons.account_tree_outlined,
            dropdownButton: substationDropdown(),
            labelText: "Gardu",
          ),
          WDropdownWrapper(
            prefixIcon: Icons.lightbulb_outline,
            dropdownButton: powerRateDropdown(),
            labelText: "Tarif Daya",
          ),
          VSpacing(TSpacing * 3),
          Text(
            "Data KWH",
            style: TTextStyle.medium(
              color: TColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          VSpacing(TSpacing * 2),
          WTextField(
            icon: Icons.api_rounded,
            labelText: "Nomor KWH",
            required: true,
            onChanged: (String v) {
              this._customer.kWHNumber = v;
            },
          ),
          WTextField(
            icon: Icons.api_rounded,
            labelText: "Merk KWH",
            required: true,
            onChanged: (String v) {
              this._customer.kWHBrand = v;
            },
          ),
          WTextField(
            icon: Icons.calendar_today,
            labelText: "Tahun TERA KWH",
            required: true,
            onChanged: (String v) {
              this._customer.kWHYear = v;
            },
          ),
          VSpacing(TSpacing * 3),
          Text(
            "Data Lokasi",
            style: TTextStyle.medium(
              color: TColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          VSpacing(TSpacing * 2),
          WTextField(
            icon: Icons.adjust_rounded,
            labelText: "Latitude",
            required: true,
            onChanged: (String v) {
              this._customer.latitude = v;
            },
          ),
          WTextField(
            icon: Icons.adjust_rounded,
            labelText: "Longitude",
            required: true,
            onChanged: (String v) {
              this._customer.longitude = v;
            },
          ),
          VSpacing(TSpacing * 4),
          Text(
            "Aksi",
            style: TTextStyle.medium(
              color: TColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          VSpacing(TSpacing * 2),
          WButton(
            backgroundColor: TColors.red,
            isFilled: false,
            textColor: TColors.red,
            text: "Hapus",
            onTap: () {},
          ),
          VSpacing(TSpacing * 2),
          WButton(
            backgroundColor: TColors.primary,
            textColor: TColors.primary[-3],
            text: "Simpan",
            onTap: () async {
              if (!_formKey.currentState.validate()) {
                return;
              }

              try {
                this._customer.powerRatingID = _dsPowerRate.selectedValue.iD;
                this._customer.substationID = _dsSubstation.selectedValue.iD;
                this._customer.verified = true;

                await UCCustomerDataForm(
                  context,
                  customer: this._customer,
                ).create();

                _formKey.currentState.reset();
              } catch (Exception) {
                UDialog(context).showSingleButtonDialog(
                  title: "Data Pelanggan",
                  content: "Pembuatan Data Pelanggan Gagal",
                  buttonText: "OK",
                );
              }
            },
          ),
          VSpacing(TSpacing * 4),
        ],
      ),
    );
  }

  Widget substationDropdown() {
    return DropdownButton(
      value: _dsSubstation.selectedValue,
      isExpanded: true,
      icon: Icon(
        Icons.keyboard_arrow_down_sharp,
        color: Colors.transparent,
      ),
      style: TTextStyle.normal(
        color: TColors.primary,
      ),
      underline: SizedBox(),
      iconSize: 24,
      isDense: true,
      elevation: 4,
      onChanged: (MSubstation newValue) {
        setState(() {
          _dsSubstation.selectedValue = newValue;
        });
      },
      items: _dsSubstation.values
          .map<DropdownMenuItem<MSubstation>>(
              (MSubstation value) => DropdownMenuItem<MSubstation>(
                  value: value,
                  child: Text(
                    value.name,
                  )))
          .toList(),
    );
  }

  Widget powerRateDropdown() {
    return DropdownButton(
      value: _dsPowerRate.selectedValue,
      isExpanded: true,
      icon: Icon(
        Icons.keyboard_arrow_down_sharp,
        color: Colors.transparent,
      ),
      style: TTextStyle.normal(
        color: TColors.primary,
      ),
      underline: SizedBox(),
      iconSize: 24,
      isDense: true,
      elevation: 4,
      onChanged: (MPowerRate newValue) {
        setState(() {
          _dsPowerRate.selectedValue = newValue;
        });
      },
      items: _dsPowerRate.values
          .map<DropdownMenuItem<MPowerRate>>(
            (MPowerRate value) => DropdownMenuItem<MPowerRate>(
              value: value,
              child: Text(
                value.name,
              ),
            ),
          )
          .toList(),
    );
  }
}
