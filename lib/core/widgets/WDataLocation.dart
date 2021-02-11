import 'package:atlok/core/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'WButton.dart';
import 'WSpacing.dart';

class WDataLocation extends StatelessWidget {
  final String latitude;
  final String longitude;
  const WDataLocation({
    Key key,
    this.latitude,
    this.longitude,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Titik Lokasi",
          style: TTextStyle.small(
            color: TColors.primary[3],
          ),
        ),
        Text(
          "$latitude, $longitude",
          textAlign: TextAlign.justify,
          style: TTextStyle.small(
            color: TColors.primary[3],
            fontWeight: FontWeight.w600,
          ),
        ),
        // VSpacing(TSpacing),
        // Container(
        //   decoration: BoxDecoration(
        //     color: Colors.grey,
        //     borderRadius: BorderRadius.circular(TSpacing),
        //   ),
        //   child: AspectRatio(aspectRatio: 16 / 9),
        // ),
        VSpacing(TSpacing),
        WButton(
          backgroundColor: TColors.primary,
          textColor: TColors.primary[-3],
          text: "Navigasi",
          onTap: () async {
            String url = "geo:$latitude,$longitude?z=17&q=$latitude,$longitude";
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
        ),
      ],
    );
  }
}
