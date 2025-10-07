import 'package:flutter/cupertino.dart';
import 'package:onestop_ui/index.dart';

class OFoodModal extends StatefulWidget {
  final String heading;
  final String subheading;
  final String body;
  final String? bannerHeading;
  final String? bannerBody;
  final String? bannerLabel;
  final String? subLabel1;
  final String? subLabel2;
  final String? buttonLabel1;
  final String? buttonLabel2;
  final IconData? bannerIcon;
  final IconData? headerIcon;
  final IconData? headerButtonIcon;
  final IconData? subLabelIcon1;
  final IconData? subLabelIcon2;
  final IconData? buttonIcon1;
  final IconData? buttonIcon2;
  final Color? bannerColor;
  final Color? bannerTextColor;
  final String? modalImageURl;
  final Map<String, Function> dataMap;
  final Function()? headerButtonPressed;
  final Function()? buttonPressed1;
  final Function()? buttonPressed2;

  const OFoodModal({
    super.key,
    required this.heading,
    required this.subheading,
    this.headerIcon,
    this.headerButtonIcon,
    this.modalImageURl,
    this.headerButtonPressed,
    this.subLabel1,
    this.subLabel2,
    this.buttonLabel1,
    this.buttonLabel2,
    this.subLabelIcon1,
    this.subLabelIcon2,
    this.buttonIcon1,
    this.buttonIcon2,
    this.buttonPressed1,
    this.buttonPressed2,
    required this.body,
    this.bannerHeading,
    this.bannerBody,
    this.bannerLabel,
    this.bannerIcon,
    this.bannerTextColor,
    this.bannerColor,
    required this.dataMap,
  });

  @override
  State<OFoodModal> createState() => _OFoodModalState();
}

class _OFoodModalState extends State<OFoodModal> {
  @override
  void initState() {
    super.initState();
  }

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OModalHeader(
              heading: widget.heading,
              subheading: widget.subheading,
              onPressed: widget.headerButtonPressed,
              imageURl: widget.modalImageURl,
              buttonIcon: widget.headerButtonIcon,
            ),
            Padding(
              padding: const EdgeInsets.only(left: OSpacing.xxs),
              child: OCardLabels(
                label: widget.subLabel1!,
                icon: widget.subLabelIcon1!,
                color: OColor.gray600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: OSpacing.xxs),
              child: OCardLabels(
                label: widget.subLabel2!,
                icon: widget.subLabelIcon2!,
                color: OColor.gray600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: OSpacing.s,
                vertical: OSpacing.xs,
              ),
              child: OText(
                text: widget.body,
                style: OTextStyle.bodySmall.copyWith(color: OColor.gray800),
              ),
            ),
            OModalBanner(
              heading: widget.bannerHeading!,
              body: widget.bannerBody!,
              icon: widget.bannerIcon,
              color: widget.bannerColor,
              textColor: widget.bannerTextColor,
              label: widget.bannerLabel,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: OSpacing.s,
                vertical: OSpacing.xs,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (widget.buttonLabel1 != null)
                    SecondaryButton(
                      label: widget.buttonLabel1!,
                      onPressed: widget.buttonPressed1,
                      leadingIcon: widget.buttonIcon1,
                      iconColor: OColor.green600,
                    ),
                  if (widget.buttonLabel2 != null)
                    SecondaryButton(
                      label: widget.buttonLabel2!,
                      onPressed: widget.buttonPressed2,
                      leadingIcon: widget.buttonIcon2,
                      iconColor: OColor.green600,
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: OSpacing.s,
                vertical: OSpacing.xs,
              ),
              child: OText(
                text: "Menu",
                style: OTextStyle.headingMedium.copyWith(color: OColor.gray800),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: OSpacing.s,
                vertical: OSpacing.xs,
              ),
              child: SizedBox(
                height: 200,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.dataMap.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: OSpacing.s,
                    crossAxisSpacing: OSpacing.s,
                  ),
                  itemBuilder: (context, index) {
                    final imageUrl = widget.dataMap.keys.elementAt(index);
                    final onTap = widget.dataMap.values.elementAt(index);
                    return GestureDetector(
                      onTap: () => onTap,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(OCornerRadius.s),
                          image: DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
