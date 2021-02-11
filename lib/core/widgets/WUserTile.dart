import 'package:atlok/core/models/MUser.dart';
import 'package:atlok/core/routes/router.gr.dart';
import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:atlok/features/verification/usecases/u.user_register_verification.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WUserTile extends StatelessWidget {
  final MUser user;

  final bool showVerificationIcon;
  const WUserTile({
    Key key,
    this.showVerificationIcon = true,
    @required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  Icons.person,
                  color: TColors.primary,
                ),
              ),
            ),
            HSpacing(TSpacing * 2),
            Expanded(
              child: Text(
                "${user.username}",
                style: TTextStyle.normal(
                  color: TColors.primary[3],
                ),
              ),
            ),
            HSpacing(TSpacing * 2),
            showVerificationIcon
                ? WVerificationIcon(
                    userId: user.iD,
                  )
                : SizedBox(),
          ],
        ),
        VSpacing(TSpacing * 2),
      ],
    );
  }
}

class WVerificationIcon extends StatelessWidget {
  final int userId;
  const WVerificationIcon({
    Key key,
    @required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          icon: FaIcon(
            FontAwesomeIcons.check,
            color: TColors.primary,
            size: 18,
          ),
          onPressed: () async {
            await UCUserRegisterVerification(context)
                .verifyUser(id: this.userId);
            ExtendedNavigator.root.replace(Routes.vUserRegisterVerification);
          },
        ),
        HSpacing(TSpacing * 4),
        IconButton(
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          icon: FaIcon(
            FontAwesomeIcons.times,
            color: TColors.red,
            size: 20,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
