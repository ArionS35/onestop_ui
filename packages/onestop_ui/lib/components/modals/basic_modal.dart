import 'package:flutter/cupertino.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_ui/index.dart';


class OModalBasic extends StatelessWidget {
  const OModalBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(OSpacing.xs),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: OColor.gray200, width: 1),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(OCornerRadius.l), topRight: Radius.circular(OCornerRadius.l),)
        ),
        child: Column(
          children: [
            OModalHeader(heading: "Modal Heading",
              subheading: "Modal Subheading",
              onPressed: () {},
              imageURl:
              "https://variety.com/wp-content/uploads/2019/10/shutterstock_editorial_10435445et.jpg?w=1000&h=667&crop=1",
              buttonIcon: TablerIcons.arrow_rotary_first_left,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:OSpacing.s, vertical: OSpacing.xs),
              child: OText(
                text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
                style: OTextStyle.bodySmall.copyWith(color: OColor.gray800),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: OSpacing.s, vertical:OSpacing.xs),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SecondaryButton(label: "Label", onPressed: (){},leadingIcon:TablerIcons.arrow_rotary_first_left, iconColor: OColor.green600,),
                  SecondaryButton(label: "Label", onPressed: (){},leadingIcon:TablerIcons.arrow_rotary_first_left, iconColor: OColor.green600,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
