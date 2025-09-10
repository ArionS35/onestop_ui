import 'package:flutter/material.dart';
import 'package:onestop_ui/index.dart';

enum BannerType { warning, negative, positive, accent, accent_no_icon }

class OBanner extends StatelessWidget {
  final BannerType type;
  final String headline;
  final String paragraph;
  final Widget? myButton;

  const OBanner({
    required this.type,
    this.myButton,
    required this.headline,
    required this.paragraph,
    super.key,
  });

  IconData? _getIcon() {
    switch (type) {
      case BannerType.warning:
      case BannerType.negative:
      case BannerType.accent:
        return Icons.warning_amber_rounded;
      case BannerType.positive:
        return Icons.done_rounded;
      case BannerType.accent_no_icon:
        return null;
    }
  }

  Color _getBackgroundColor() {
    switch (type) {
      case BannerType.warning:
        return OColor.yellow100;
      case BannerType.negative:
        return OColor.red200;
      case BannerType.positive:
        return OColor.green100;
      case BannerType.accent:
        return OColor.blue100;
      case BannerType.accent_no_icon:
        return OColor.blue100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(OSpacing.xs),
      child: Container(
        padding: const EdgeInsets.all(OSpacing.xs),
        decoration: BoxDecoration(
          color: _getBackgroundColor(),
          borderRadius: BorderRadius.circular(OCornerRadius.s),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (_getIcon() != null)
                SizedBox(
                  height: 32,
                  width: 32,
                  child: Center(
                    child: Icon(_getIcon(), size: 32, color: OColor.gray800),
                  ),
                ),
                if (_getIcon() != null)
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      headline,
                      style: OTextStyle.headingSmall.copyWith(
                        color: OColor.gray800,
                      ),
                    ),
                    Text(
                      paragraph,
                      style: OTextStyle.bodyMedium.copyWith(
                        color: OColor.gray800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Align(alignment: Alignment.topCenter, child: myButton),
          ],
        ),
      ),
    );
  }
}
