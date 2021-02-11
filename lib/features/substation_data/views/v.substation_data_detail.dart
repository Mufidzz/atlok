import 'package:atlok/core/models/MSubstation.dart';
import 'package:atlok/core/routes/router.gr.dart';
import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/utilities/UShowDialog.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:atlok/features/substation_data/usecases/u.substation_data_form.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class VSubstationDataDetail extends StatelessWidget {
  final MSubstation substation;

  const VSubstationDataDetail({Key key, @required this.substation})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WSafeArea(
      color: TColors.primary,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: TColors.primary,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_outlined),
                onPressed: () {
                  ExtendedNavigator.root.pop();
                },
              ),
              title: Text(
                "Data Gardu",
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Informasi Gardu",
                        style: TTextStyle.medium(
                          color: TColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      VSpacing(TSpacing * 3),
                      WDataInformationTile(
                        title: "Nomor Gardu",
                        content: "${substation.code}",
                      ),
                      WDataInformationTile(
                        title: "Nama Gardu",
                        content: "${substation.name}",
                      ),
                      WDataLocation(
                        latitude: "${substation.latitude}",
                        longitude: "${substation.longitude}",
                      ),
                      VSpacing(TSpacing * 4),
                      Text(
                        "Aksi",
                        style: TTextStyle.medium(
                          color: TColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      WLeveledWidget(
                        minimumLevel: 1,
                        child: Column(
                          children: [
                            VSpacing(TSpacing * 2),
                            WButton(
                              backgroundColor: TColors.red,
                              isFilled: false,
                              textColor: TColors.red,
                              text: "Hapus Data",
                              onTap: () {
                                UDialog(context)
                                    .showDeleteConfirmationDialog(
                                        title: "Konfirmasi Hapus",
                                        content:
                                            "Yakin akan Menghapus Item ini, Penghapusan Mungkin Memiliki Efek Pada Beberapa Item Lain",
                                        rightButtonText: "Batal",
                                        leftButtonText: "Hapus")
                                    .then(
                                  (confirmed) {
                                    if (confirmed) {
                                      UCSubstationDataForm(context)
                                          .deleteSubstation(
                                        id: substation.iD.toString(),
                                      );
                                    }
                                  },
                                );
                              },
                            ),
                            VSpacing(TSpacing * 2),
                            WButton(
                              backgroundColor: TColors.primary,
                              textColor: TColors.primary[-3],
                              text: "Edit Data",
                              onTap: () {
                                ExtendedNavigator.root.push(
                                  Routes.vSubstationDataForm,
                                  arguments: VSubstationDataFormArguments(
                                      substation: substation),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      VSpacing(TSpacing * 4),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
