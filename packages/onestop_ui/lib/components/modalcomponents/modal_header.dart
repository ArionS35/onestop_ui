import 'package:flutter/material.dart';
import 'package:onestop_ui/index.dart';

class OModalHeader extends StatelessWidget {
  final IconData? icon;
  final IconData? buttonIcon;
  final String? imageURl;
  final String heading;
  final String subheading;
  final Function()? onPressed;

  const OModalHeader({
    super.key,
    this.icon,
    this.buttonIcon,
    this.imageURl,
    required this.heading,
    required this.subheading,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: OSpacing.s,
        vertical: OSpacing.xxs,
      ),
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.all(OSpacing.xs),
                  child: SizedBox(
                    width: 32,
                    height: 32,
                    child: Icon(icon, size:32, color: OColor.gray600),
                  ),
                ),
              if (imageURl != null)
                Padding(
                  padding: const EdgeInsets.all(OSpacing.xs),
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(imageURl!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(OSpacing.xs),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OText(
                      text: heading,
                      style: OTextStyle.labelLarge.copyWith(color: OColor.gray800),
                    ),
                    SizedBox(width: OSpacing.xs),
                    OText(
                      text: subheading,
                      style: OTextStyle.bodySmall.copyWith(color: OColor.gray600),
                    ),
                  ],
                ),
              ),
            ],
          ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(OCornerRadius.xl),
                color: OColor.gray100,
              ),
              width: 40,
              height: 40,
              child: IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(
                  buttonIcon,
                  size: 24,
                  color: OColor.gray600,
                ),
                onPressed: onPressed,
              ),
            ),
        ],
      ),
    );
  }
}
