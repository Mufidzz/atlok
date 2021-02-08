import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/widgets.dart';
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
                onPressed: () {},
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
                  child: Form(
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
                        ),
                        WTextField(
                          icon: Icons.person_outline,
                          labelText: "Nama Lengkap",
                        ),
                        WTextField(
                          icon: Icons.home_outlined,
                          labelText: "Alamat Lengkap",
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
                        ),
                        WTextField(
                          icon: Icons.account_tree_outlined,
                          labelText: "Gardu",
                        ),
                        WTextField(
                          icon: Icons.lightbulb_outline,
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
                        ),
                        WTextField(
                          icon: Icons.api_rounded,
                          labelText: "Merk KWH",
                        ),
                        WTextField(
                          icon: Icons.calendar_today,
                          labelText: "Tahun TERA KWH",
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
                        ),
                        WTextField(
                          icon: Icons.adjust_rounded,
                          labelText: "Longitude",
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
                          onTap: () {},
                        ),
                        VSpacing(TSpacing * 4),
                      ],
                    ),
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
