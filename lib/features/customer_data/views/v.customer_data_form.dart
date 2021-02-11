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
  final MACustomer customer;

  const VCustomerDataForm({Key key, this.customer}) : super(key: key);

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
                  child: CustomerForm(
                    customer: customer,
                  ),
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
  final MACustomer customer;
  const CustomerForm({
    Key key,
    this.customer,
  }) : super(key: key);

  @override
  _CustomerFormState createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  GlobalKey<FormState> _formKey;
  MACustomer _customer;
  MDropdown<MSubstation> _dsSubstation = new MDropdown();
  MDropdown<MPowerRate> _dsPowerRate = new MDropdown();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formKey = GlobalKey<FormState>();
    _customer = widget.customer ??
        new MACustomer(
          substation: new MSubstation(),
          powerRating: new MPowerRate(),
        );
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
            initialValue: this._customer.iDPEL ?? "",
          ),
          WTextField(
            icon: Icons.person_outline,
            labelText: "Nama Lengkap",
            required: true,
            onChanged: (String v) {
              this._customer.fullName = v;
            },
            initialValue: this._customer.fullName ?? "",
          ),
          WTextField(
            icon: Icons.home_outlined,
            labelText: "Alamat Lengkap",
            required: true,
            onChanged: (String v) {
              this._customer.address = v;
            },
            initialValue: this._customer.address ?? "",
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
            initialValue: this._customer.poleNumber ?? "",
          ),
          VSpacing(TSpacing * 1),

          WButton(
            backgroundColor: TColors.primary,
            textColor: TColors.primary,
            text: _customer.substation.name ?? "Pilih Gardu",
            onTap: () {
              UDialog(context).showSubstationSelectDialog().then((v) {
                if (v != null) {
                  setState(() {
                    this._customer.substation = v;
                    this._customer.substationID = v.iD;
                  });
                }
              });
            },
            isFilled: false,
          ),
          VSpacing(TSpacing * 2),

          WButton(
            backgroundColor: TColors.primary,
            textColor: TColors.primary,
            text: _customer.powerRating.name ?? "Pilih Tarif Daya",
            onTap: () {
              UDialog(context).showPowerRateSelectDialog().then((v) {
                if (v != null) {
                  setState(() {
                    this._customer.powerRating = v;
                    this._customer.powerRatingID = v.iD;
                  });
                }
              });
            },
            isFilled: false,
          ),
          // WDropdownWrapper(
          //   prefixIcon: Icons.account_tree_outlined,
          //   dropdownButton: substationDropdown(),
          //   labelText: "Gardu",
          // ),
          // WDropdownWrapper(
          //   prefixIcon: Icons.lightbulb_outline,
          //   dropdownButton: powerRateDropdown(),
          //   labelText: "Tarif Daya",
          // ),
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
            initialValue: this._customer.kWHNumber ?? "",
          ),
          WTextField(
            icon: Icons.api_rounded,
            labelText: "Merk KWH",
            required: true,
            onChanged: (String v) {
              this._customer.kWHBrand = v;
            },
            initialValue: this._customer.kWHBrand ?? "",
          ),
          WTextField(
            icon: Icons.calendar_today,
            labelText: "Tahun TERA KWH",
            required: true,
            keyboardType: TextInputType.number,
            onChanged: (String v) {
              this._customer.kWHYear = v;
            },
            initialValue: this._customer.kWHYear ?? "",
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
            keyboardType: TextInputType.number,
            onChanged: (String v) {
              this._customer.latitude = v;
            },
            initialValue: this._customer.latitude ?? "",
          ),
          WTextField(
            icon: Icons.adjust_rounded,
            labelText: "Longitude",
            required: true,
            keyboardType: TextInputType.number,
            onChanged: (String v) {
              this._customer.longitude = v;
            },
            initialValue: this._customer.longitude ?? "",
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
            backgroundColor: TColors.primary,
            textColor: TColors.primary[-3],
            text: "Simpan",
            onTap: () async {
              if (!_formKey.currentState.validate()) {
                return;
              }

              try {
                if (widget.customer.iD == null) {
                  this._customer.verified = true;
                  await UCCustomerDataForm(
                    context,
                    customer: this._customer,
                  ).create();
                } else {
                  await UCCustomerDataForm(
                    context,
                    customer: this._customer,
                  ).update(id: widget.customer.iD.toString());
                }

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
