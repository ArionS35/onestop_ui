import 'package:flutter/material.dart';
import 'package:onestop_ui/index.dart';

class OModalHeader extends StatelessWidget {
  final IconData? icon;
  final IconData? buttonIcon;
  final String? imageURl;
  final String heading;
  final String? subheading;
  final Color? iconColor;
  final Function()? onPressed;

  const OModalHeader({
    super.key,
    this.icon,
    this.buttonIcon,
    this.imageURl,
    this.iconColor,
    required this.heading,
    this.subheading,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: OSpacing.xs,
        vertical: OSpacing.xs,
      ),
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (icon != null)
                SizedBox(
                  width: 32,
                  height: 32,
                  child: Icon(icon, size:32, color: iconColor),
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OText(
                      text: heading,
                      style: OTextStyle.labelLarge.copyWith(color: OColor.gray800),
                    ),
                    if(subheading != null)
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
