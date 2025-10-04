import 'package:flutter/material.dart';
import 'package:onestop_ui/index.dart';

class OModalBanner extends StatelessWidget {
  final String heading;
  final String? label;
  final String body;
  final IconData? icon;
  final Color? color;
  final Color? textColor;

  const OModalBanner({
    super.key,
    required this.heading,
    required this.body,
    this.color,
    this.textColor,
    this.icon,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(OSpacing.xs),
      child: Container(
        padding: const EdgeInsets.all(OSpacing.xs),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(OCornerRadius.l),
          color: color ?? OColor.blue500,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (icon != null)
                      Padding(
                        padding: const EdgeInsets.all(OSpacing.xs),
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: Icon(icon, size: 24, color: OColor.white),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(OSpacing.xs),
                      child: OText(
                        text: heading,
                        style: OTextStyle.labelSmall.copyWith(
                          color: textColor ?? OColor.white,
                        ),
                      ),
                    ),
                  ],
                ),
                if (label != null)
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(OCornerRadius.l),
                        right: Radius.circular(OCornerRadius.l),
                      ),
                      color: OColor.blue400,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(OSpacing.xs),
                      child: OText(
                        text: label!.toUpperCase(),
                        style: OTextStyle.labelXSmall.copyWith(
                          color: textColor ?? OColor.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(OSpacing.xs),
              child: OText(
                text: body,
                style: OTextStyle.bodyXSmall.copyWith(
                  color: textColor ?? OColor.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
