import 'package:flutter/cupertino.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_ui/index.dart';

class OModalBasic extends StatelessWidget {
  final String heading;
  final String subheading;
  final String body;
  final String? buttonLabel1;
  final String? buttonLabel2;
  final IconData? headerIcon;
  final IconData? headerButtonIcon;
  final IconData? buttonIcon1;
  final IconData? buttonIcon2;
  final String? modalImageURl;
  final Function()? headerButtonPressed;
  final Function()? buttonPressed1;
  final Function()? buttonPressed2;

  const OModalBasic({
    super.key,
    required this.heading,
    required this.subheading,
    this.headerIcon,
    this.headerButtonIcon,
    this.modalImageURl,
    this.headerButtonPressed,
    this.buttonLabel1,
    this.buttonLabel2,
    this.buttonIcon1,
    this.buttonIcon2,
    this.buttonPressed1,
    this.buttonPressed2,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(OSpacing.xs),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: OColor.gray200, width: 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(OCornerRadius.l),
            topRight: Radius.circular(OCornerRadius.l),
          ),
        ),
        child: Column(
          children: [
            OModalHeader(
              heading: heading,
              subheading: subheading,
              onPressed: headerButtonPressed,
              imageURl: modalImageURl,
              buttonIcon: TablerIcons.arrow_rotary_first_left,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: OSpacing.s,
                vertical: OSpacing.xs,
              ),
              child: OText(
                text: body,
                style: OTextStyle.bodySmall.copyWith(color: OColor.gray800),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: OSpacing.s,
                vertical: OSpacing.xs,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (buttonLabel1 != null)
                    SecondaryButton(
                      label: buttonLabel1!,
                      onPressed: buttonPressed1,
                      leadingIcon: buttonIcon1,
                      iconColor: OColor.green600,
                    ),
                  if (buttonLabel2 != null)
                    SecondaryButton(
                      label: buttonLabel2!,
                      onPressed: buttonPressed2,
                      leadingIcon: buttonIcon2,
                      iconColor: OColor.green600,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OModalSecondary extends StatelessWidget {
  final String heading;
  final String? userHeading;
  final String? userSubheading;
  final String? userPhone;
  final String? userEmail;
  final String? bannerHeading;
  final String? bannerBody;
  final String? buttonLabel1;
  final String? buttonLabel2;
  final String? buttonLabel3;
  final String? buttonLabel4;
  final String? buttonLabel5;
  final IconData? headerIcon;
  final IconData? headerButtonIcon;
  final IconData? buttonIcon1;
  final IconData? buttonIcon2;
  final IconData? buttonIcon3;
  final IconData? buttonIcon4;
  final String? modalImageURl;
  final String? userImageURl;
  final Function()? headerButtonPressed;
  final Function()? buttonPressed1;
  final Function()? buttonPressed2;
  final Function()? buttonPressed3;
  final Function()? buttonPressed4;
  final Function()? buttonPressed5;

  const OModalSecondary({
    super.key,
    required this.heading,
    this.userHeading,
    this.userSubheading,
    this.userPhone,
    this.userEmail,
    this.bannerHeading,
    this.bannerBody,
    this.buttonLabel1,
    this.buttonLabel2,
    this.buttonLabel3,
    this.buttonLabel4,
    this.buttonLabel5,
    this.headerIcon,
    this.headerButtonIcon,
    this.buttonIcon1,
    this.buttonIcon2,
    this.modalImageURl,
    this.userImageURl,
    this.headerButtonPressed,
    this.buttonPressed1,
    this.buttonPressed2,
    this.buttonPressed3,
    this.buttonPressed4,
    this.buttonPressed5,
    this.buttonIcon3,
    this.buttonIcon4,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(OSpacing.xs),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: OColor.gray200, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(OCornerRadius.l)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OModalHeader(
              heading: heading,
              icon: headerIcon,
              iconColor: OColor.green600,
              buttonIcon: headerButtonIcon,
            ),
            if (userImageURl != null && userHeading != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: OSpacing.xs),
                child: OProfile(
                  size: ProfileSize.large,
                  url: userImageURl!,
                  name: userHeading!,
                  info: userSubheading,
                ),
              ),
            if (bannerHeading != null)
              OModalBanner(
                heading: bannerHeading!,
                body: bannerBody!,
                color: OColor.blue100,
                textColor: OColor.gray800,
              ),
            if (userPhone != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: OSpacing.xs),
                child: OCardLabels(
                  label: userPhone!,
                  icon: TablerIcons.phone,
                  color: OColor.gray600,
                ),
              ),
            if (userEmail != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: OSpacing.xs),
                child: OCardLabels(
                  label: userEmail!,
                  icon: TablerIcons.mail,
                  color: OColor.gray600,
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(OSpacing.xs),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (buttonLabel1 != null)
                    SecondaryButton(
                      label: buttonLabel1!,
                      onPressed: buttonPressed1!,
                      leadingIcon: buttonIcon1,
                      iconColor: OColor.green600,
                    ),
                  if (buttonLabel2 != null)
                    SecondaryButton(
                      label: buttonLabel2!,
                      onPressed: buttonPressed2,
                      leadingIcon: buttonIcon2,
                      iconColor: OColor.green600,
                    ),
                  if (buttonLabel3 != null)
                    SecondaryButton(
                      label: buttonLabel3!,
                      onPressed: buttonPressed3,
                      leadingIcon: buttonIcon3,
                      iconColor: OColor.green600,
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(OSpacing.xs),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (buttonLabel4 != null)
                    SecondaryButton(
                      label: buttonLabel4!,
                      onPressed: buttonPressed4,
                      leadingIcon: buttonIcon4,
                    ),
                  if (buttonLabel5 != null)
                    PrimaryButton(
                      label: buttonLabel5!,
                      onPressed: buttonPressed5,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
