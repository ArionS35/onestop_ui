import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_ui/index.dart';

class OModalBanner extends StatelessWidget {
  const OModalBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(OSpacing.xs),
      child: Container(
        padding: const EdgeInsets.all(OSpacing.xs),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(OCornerRadius.l),
          color: OColor.blue500,
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
                    Padding(
                      padding: const EdgeInsets.all(OSpacing.xs),
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: Icon(TablerIcons.arrow_rotary_first_left, size:24, color: OColor.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(OSpacing.xs),
                      child: OText(
                        text: "Banner Heading",
                        style: OTextStyle.labelSmall.copyWith(color: OColor.white),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(left:Radius.circular(OCornerRadius.l), right: Radius.circular(OCornerRadius.l),),
                    color: OColor.blue400,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(OSpacing.xs),
                    child: OText(
                      text: "LABEL",
                      style: OTextStyle.labelXSmall.copyWith(color: OColor.white),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(OSpacing.xs ),
              child: OText(
                text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                style: OTextStyle.bodyXSmall.copyWith(color: OColor.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
