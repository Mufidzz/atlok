import 'package:atlok/core/models/MPowerRate.dart';
import 'package:atlok/core/models/MSubstation.dart';
import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/WButton.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:atlok/features/substation_data/views/v.find_substation_data.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class UDialog {
  final BuildContext context;
  UDialog(this.context);

  Future<void> showSingleButtonDialog({
    @required String title,
    @required String content,
    @required String buttonText,
    Color buttonColor = TColors.primary,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        contentPadding: EdgeInsets.fromLTRB(
          TSpacing * 4,
          TSpacing,
          TSpacing * 4,
          TSpacing * 2,
        ),
        titlePadding: EdgeInsets.fromLTRB(
          TSpacing * 4,
          TSpacing * 4,
          TSpacing * 4,
          0,
        ),
        title: Text(
          "$title",
          style: TTextStyle.normal(
            fontWeight: FontWeight.w600,
            color: TColors.primary[3],
          ),
        ),
        content: Text(
          "$content",
          style: TTextStyle.normal(
            color: TColors.primary[3],
          ),
        ),
        actions: [
          Container(
            width: TSpacing * 30,
            child: WButton(
              height: TSpacing * 6,
              textColor: Colors.white,
              backgroundColor: buttonColor,
              text: "$buttonText",
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          )
        ],
      ),
    );
  }

  Future<bool> showDeleteConfirmationDialog({
    @required String title,
    @required String content,
    @required String leftButtonText,
    @required String rightButtonText,
    Color buttonColor = TColors.primary,
  }) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        contentPadding: EdgeInsets.fromLTRB(
          TSpacing * 4,
          TSpacing,
          TSpacing * 4,
          TSpacing * 2,
        ),
        titlePadding: EdgeInsets.fromLTRB(
          TSpacing * 4,
          TSpacing * 4,
          TSpacing * 4,
          0,
        ),
        title: Text(
          "$title",
          style: TTextStyle.normal(
            fontWeight: FontWeight.w600,
            color: TColors.primary[3],
          ),
        ),
        content: Text(
          "$content",
          style: TTextStyle.normal(
            color: TColors.primary[3],
          ),
        ),
        actions: [
          Container(
            width: TSpacing * 30,
            child: WButton(
              isFilled: false,
              height: TSpacing * 6,
              textColor: TColors.red,
              backgroundColor: TColors.red,
              text: "$leftButtonText",
              onTap: () {
                Navigator.of(context).pop(true);
              },
            ),
          ),
          Container(
            width: TSpacing * 30,
            child: WButton(
              height: TSpacing * 6,
              textColor: Colors.white,
              backgroundColor: buttonColor,
              text: "$rightButtonText",
              onTap: () {
                Navigator.of(context).pop(false);
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<MPowerRate> showPowerRateSelectDialog() async {
    return await showDialog<MPowerRate>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => Scaffold(
        backgroundColor: Colors.transparent,
        body: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width * .8,
                height: MediaQuery.of(context).size.height * .8,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      color: TColors.primary,
                      child: Text(
                        "Pilih Tarif Daya",
                        style: TTextStyle.medium(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: TSpacing,
                        right: TSpacing,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: WTextField(
                              icon: Icons.search,
                              labelText: "Kata Kunci",
                              hintText: "Nama / Kode Tarif Daya",
                            ),
                          ),
                          HSpacing(TSpacing),
                          WButton(
                            backgroundColor: TColors.primary,
                            textColor: TColors.primary,
                            text: "Cari",
                            isFilled: false,
                            width: TSpacing * 15,
                            height: TSpacing * 10,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: WPowerRateList(
                          powerRates: [
                            new MPowerRate(code: "AAA", name: "BBB"),
                          ],
                          onTileTap: (MPowerRate powerRate) {
                            print(powerRate.name);
                            Navigator.of(context).pop(powerRate);
                          },
                        ),
                      ),
                    ),
                    VSpacing(TSpacing * 2),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<MSubstation> showSubstationSelectDialog() async {
    return await showDialog<MSubstation>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => Scaffold(
        backgroundColor: Colors.transparent,
        body: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width * .8,
                height: MediaQuery.of(context).size.height * .8,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      color: TColors.primary,
                      child: Text(
                        "Pilih Gardu",
                        style: TTextStyle.medium(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: TSpacing,
                        right: TSpacing,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: WTextField(
                              icon: Icons.search,
                              labelText: "Kata Kunci",
                              hintText: "Nama / Kode Gardu",
                            ),
                          ),
                          HSpacing(TSpacing),
                          WButton(
                            backgroundColor: TColors.primary,
                            textColor: TColors.primary,
                            text: "Cari",
                            isFilled: false,
                            width: TSpacing * 15,
                            height: TSpacing * 10,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: WSubstationList(
                          substations: [
                            new MSubstation(
                              code: "ABCDE",
                              name: "ABCCDDEE",
                            ),
                          ],
                          onTileTap: (MSubstation substation) {
                            Navigator.of(context).pop(substation);
                          },
                        ),
                      ),
                    ),
                    VSpacing(TSpacing * 2),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WPowerRateList extends StatelessWidget {
  final List<MPowerRate> powerRates;
  final Function onTileTap;
  const WPowerRateList({
    Key key,
    @required this.powerRates,
    @required this.onTileTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        powerRates.length,
        (index) => WPowerRateTile(
          powerRate: powerRates[index],
          onTap: (MPowerRate powerRate) {
            onTileTap(powerRate);
          },
        ),
      ),
    );
  }
}

class WSubstationList extends StatelessWidget {
  final Function onTileTap;
  final List<MSubstation> substations;
  const WSubstationList({
    Key key,
    @required this.substations,
    @required this.onTileTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        substations.length,
        (index) => WSubstationTile(
          substation: substations[index],
          onTap: (MSubstation substation) {
            onTileTap(substation);
          },
        ),
      ),
    );
  }
}

class WPowerRateTile extends StatelessWidget {
  final Function onTap;
  final MPowerRate powerRate;
  const WPowerRateTile({
    Key key,
    @required this.powerRate,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(powerRate);
      },
      child: Container(
        padding: EdgeInsets.only(
          top: TSpacing * 2,
          bottom: TSpacing * 2,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Icon(
                      Icons.animation,
                      color: TColors.primary[-2],
                    ),
                  ),
                ),
                HSpacing(TSpacing * 2),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${powerRate.name}",
                        style: TTextStyle.normal(
                          color: TColors.primary[3],
                        ),
                      ),
                      Text(
                        "${powerRate.code}",
                        style: TTextStyle.small(
                          color: TColors.primary[3],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WSubstationTile extends StatelessWidget {
  final Function onTap;
  final MSubstation substation;
  const WSubstationTile({
    Key key,
    @required this.substation,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(substation);
      },
      child: Container(
        padding: EdgeInsets.only(
          top: TSpacing * 2,
          bottom: TSpacing * 2,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Icon(
                      Icons.account_tree,
                      color: TColors.primary[-2],
                    ),
                  ),
                ),
                HSpacing(TSpacing * 2),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${substation.code}",
                        style: TTextStyle.normal(
                          color: TColors.primary[3],
                        ),
                      ),
                      Text(
                        "${substation.name}",
                        style: TTextStyle.small(
                          color: TColors.primary[3],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
