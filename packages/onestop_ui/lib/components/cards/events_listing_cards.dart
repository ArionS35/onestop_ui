import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_ui/index.dart';

enum EventCardSize { small, medium, large }

enum EventCardType { upcomingUser, pastUser, upcomingAdmin, pastAdmin }

class OEventListingCard extends StatefulWidget {
  final String title;
  final String date;
  final EventCardSize size;
  final EventCardType type;
  final VoidCallback? onTap;
  final bool isDisabled;

  const OEventListingCard._({
    super.key,
    required this.title,
    required this.date,
    required this.size,
    required this.type,
    this.onTap,
    this.isDisabled = false,
  });
  const OEventListingCard.pastAdmin({
    Key? key,
    required String title,
    required String date,
    required EventCardSize size,
    VoidCallback? onTap,
    bool isDisabled = false,
  }) : this._(
         key: key,
         title: title,
         date: date,
         size: size,
         type: EventCardType.pastAdmin,
         onTap: onTap,
         isDisabled: isDisabled,
       );
  const OEventListingCard.pastUser({
    Key? key,
    required String title,
    required String date,
    required EventCardSize size,
    VoidCallback? onTap,
    bool isDisabled = false,
  }) : this._(
         key: key,
         title: title,
         date: date,
         size: size,
         type: EventCardType.pastUser,
         onTap: onTap,
         isDisabled: isDisabled,
       );
  const OEventListingCard.upcomingAdmin({
    Key? key,
    required String title,
    required String date,
    required EventCardSize size,
    VoidCallback? onTap,
    bool isDisabled = false,
  }) : this._(
         key: key,
         title: title,
         date: date,
         size: size,
         type: EventCardType.upcomingAdmin,
         onTap: onTap,
         isDisabled: isDisabled,
       );
  const OEventListingCard.upcomingUser({
    Key? key,
    required String title,
    required String date,
    required EventCardSize size,
    VoidCallback? onTap,
    bool isDisabled = false,
  }) : this._(
         key: key,
         title: title,
         date: date,
         size: size,
         type: EventCardType.upcomingUser,
         onTap: onTap,
         isDisabled: isDisabled,
       );

  @override
  State<OEventListingCard> createState() => _OEventListingCardState();
}

class _OEventListingCardState extends State<OEventListingCard> {
  bool _isPressed = false;
  bool _isSaved = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown:
          (_) =>
              widget.isDisabled
                  ? null
                  : setState(
                    () => _isPressed = true,
                  ), //engage behaviour when card is tapped
      onTapUp: (_) {
        setState(() => _isPressed = false);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(OCornerRadius.l),
          border: Border.all(color: OColor.gray200, width: 1),
          color: _isPressed ? OColor.gray200 : OColor.white,
        ),
        child: _buildCardContent(),
      ),
    );
  }

  Widget _buildCardContent() {
    // Build content based on size - larger cards show more info
    if (widget.size == EventCardSize.small) {
      return Padding(
        padding: const EdgeInsets.all(OSpacing.s),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(OCornerRadius.xl),
                    color: OColor.gray400,
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://variety.com/wp-content/uploads/2019/10/shutterstock_editorial_10435445et.jpg?w=1000&h=667&crop=1",
                      ),
                      fit: BoxFit.cover,
                      opacity: 1,
                    ),
                  ),
                ),
                const SizedBox(width: OSpacing.s),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OText(
                      text: "Event Title",
                      style: OTextStyle.bodyMedium.copyWith(
                        color:
                            widget.isDisabled ? OColor.gray600 : OColor.gray800,
                      ),
                    ),
                    if (_isSaved == true) const SizedBox(height: OSpacing.xxs),
                    if (_isSaved == true)
                      Row(
                        children: [
                          Icon(
                            TablerIcons.check,
                            size: 16,
                            color:
                                widget.isDisabled
                                    ? OColor.gray400
                                    : OColor.green600,
                          ),
                          const SizedBox(width: OSpacing.xxs),
                          OText(
                            text: "I'm going",
                            style: OTextStyle.labelXSmall.copyWith(
                              color:
                                  widget.isDisabled
                                      ? OColor.gray400
                                      : OColor.green600,
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(height: OSpacing.xxs),
                    OText(
                      text: "Time," + "Location",
                      style: OTextStyle.bodySmall.copyWith(
                        color:
                            widget.isDisabled ? OColor.gray400 : OColor.gray600,
                      ),
                    ),
                    const SizedBox(height: OSpacing.xs),
                    Row(
                      children: [
                        Container(
                          width: 46,
                          height: 24,
                          decoration: BoxDecoration(
                            color: OColor.gray100,
                            borderRadius: BorderRadius.circular(
                              OCornerRadius.xl,
                            ),
                          ),
                          child: Center(
                            child: OText(
                              text: "TAg1",
                              style: OTextStyle.labelXSmall.copyWith(
                                color:
                                    widget.isDisabled
                                        ? OColor.gray400
                                        : OColor.blue600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: OSpacing.m),
                        Container(
                          width: 46,
                          height: 24,
                          decoration: BoxDecoration(
                            color: OColor.gray100,
                            borderRadius: BorderRadius.circular(
                              OCornerRadius.xl,
                            ),
                          ),
                          child: Center(
                            child: OText(
                              text: "TAg2",
                              style: OTextStyle.labelXSmall.copyWith(
                                color:
                                    widget.isDisabled
                                        ? OColor.gray400
                                        : OColor.green600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              TablerIcons.chevron_right,
              color: widget.isDisabled ? OColor.gray400 : OColor.gray600,
              size: 24,
            ),
          ],
        ),
      );
    }
    if (widget.size == EventCardSize.medium) {
      return Column(
        children: [
          Container(
            width: 210,
            height: 118,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(OCornerRadius.s),
                topRight: Radius.circular(OCornerRadius.s),
              ),
              color: OColor.gray400,
              image: DecorationImage(
                image: NetworkImage(
                  "https://variety.com/wp-content/uploads/2019/10/shutterstock_editorial_10435445et.jpg?w=1000&h=667&crop=1",
                ),
                fit: BoxFit.cover,
                opacity: 1,
              ),
            ),
          ),
          Container(
            width: 210,
            padding: const EdgeInsets.all(OSpacing.s),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(OCornerRadius.s),
                bottomRight: Radius.circular(OCornerRadius.s),
              ),
              border: Border.all(color: OColor.gray200, width: 1),
              color: _isPressed ? OColor.gray200 : OColor.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OText(
                  text: "Event Title",
                  style: OTextStyle.bodyMedium.copyWith(
                    color: widget.isDisabled ? OColor.gray600 : OColor.gray800,
                  ),
                ),
                const SizedBox(width: OSpacing.xs),
                OText(
                  text: "Date," + " " + "Start time -" + " " + "End time",
                  style: OTextStyle.bodySmall.copyWith(
                    color: widget.isDisabled ? OColor.gray400 : OColor.gray600,
                  ),
                ),
                const SizedBox(width: OSpacing.xxs),
                OText(
                  text: "Location",
                  style: OTextStyle.bodySmall.copyWith(
                    color: widget.isDisabled ? OColor.gray400 : OColor.gray600,
                  ),
                ),
                const SizedBox(width: OSpacing.xs),
                if (_isSaved == true)
                  Row(
                    children: [
                      Icon(
                        TablerIcons.check,
                        size: 16,
                        color:
                            widget.isDisabled
                                ? OColor.gray400
                                : OColor.green600,
                      ),
                      const SizedBox(width: OSpacing.xxs),
                      OText(
                        text: "Going",
                        style: OTextStyle.labelXSmall.copyWith(
                          color:
                              widget.isDisabled
                                  ? OColor.gray400
                                  : OColor.green600,
                        ),
                      ),
                    ],
                  ),
                if (_isSaved != true)
                  Row(
                    children: [
                      const SizedBox(width: OSpacing.m),
                      OText(
                        text: "+ 350 Others",
                        style: OTextStyle.labelXSmall.copyWith(
                          color:
                              widget.isDisabled
                                  ? OColor.gray400
                                  : OColor.blue600,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      );
    }
    return Padding(
      padding: const EdgeInsets.all(OSpacing.s),
      child: Column(
        children: [
          Container(
            height: 187.53,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(OCornerRadius.s)),
              color: OColor.gray400,
              image: DecorationImage(
                image: NetworkImage(
                  "https://variety.com/wp-content/uploads/2019/10/shutterstock_editorial_10435445et.jpg?w=1000&h=667&crop=1",
                ),
                fit: BoxFit.cover,
                opacity: 1,
              ),
            ),
          ),
          const SizedBox(height: OSpacing.s),
          Row(
            children: [
              Row(
                children: [
                  Icon(
                    TablerIcons.heart_plus,
                    size: 16,
                    color: widget.isDisabled ? OColor.gray400 : OColor.blue500,
                  ),
                  const SizedBox(width: OSpacing.xxs),
                  OText(
                    text: "350",
                    style: OTextStyle.labelXSmall.copyWith(
                      color:
                          widget.isDisabled ? OColor.gray400 : OColor.blue500,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: OSpacing.s),
              Row(
                children: [
                  Icon(
                    TablerIcons.eye,
                    size: 16,
                    color: widget.isDisabled ? OColor.gray400 : OColor.blue500,
                  ),
                  const SizedBox(width: OSpacing.xxs),
                  OText(
                    text: "800",
                    style: OTextStyle.labelXSmall.copyWith(
                      color:
                          widget.isDisabled ? OColor.gray400 : OColor.blue500,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: OSpacing.s),
              Row(
                children: [
                  Icon(
                    TablerIcons.message_heart,
                    size: 16,
                    color: widget.isDisabled ? OColor.gray400 : OColor.blue500,
                  ),
                  const SizedBox(width: OSpacing.xxs),
                  OText(
                    text: "350",
                    style: OTextStyle.labelXSmall.copyWith(
                      color:
                          widget.isDisabled ? OColor.gray400 : OColor.blue500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: OSpacing.s),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OText(
                text: "Event Title",
                style: OTextStyle.headingSmall.copyWith(
                  color: widget.isDisabled ? OColor.gray600 : OColor.gray800,
                ),
              ),
              Icon(
                TablerIcons.chevron_right,
                color: widget.isDisabled ? OColor.gray400 : OColor.gray600,
                size: 24,
              ),
            ],
          ),
          const SizedBox(height: OSpacing.s),
          Row(
            children: [
              Container(
                width: 46,
                height: 24,
                decoration: BoxDecoration(
                  color: OColor.gray100,
                  borderRadius: BorderRadius.circular(OCornerRadius.xl),
                ),
                child: Center(
                  child: OText(
                    text: "TAg1",
                    style: OTextStyle.labelXSmall.copyWith(
                      color:
                          widget.isDisabled ? OColor.gray400 : OColor.blue600,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: OSpacing.m),
              Container(
                width: 46,
                height: 24,
                decoration: BoxDecoration(
                  color: OColor.gray100,
                  borderRadius: BorderRadius.circular(OCornerRadius.xl),
                ),
                child: Center(
                  child: OText(
                    text: "TAg2",
                    style: OTextStyle.labelXSmall.copyWith(
                      color:
                          widget.isDisabled ? OColor.gray400 : OColor.green600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: OSpacing.s),
          Column(
            children: [
              Row(
                children: [
                  Icon(
                    TablerIcons.map_pin,
                    color: widget.isDisabled ? OColor.gray400 : OColor.gray600,
                    size: 16,
                  ),
                  const SizedBox(width: OSpacing.xxs),
                  OText(
                    text: "Location",
                    style: OTextStyle.labelSmall.copyWith(
                      color:
                          widget.isDisabled ? OColor.gray400 : OColor.gray600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: OSpacing.xxs),
              Row(
                children: [
                  Icon(
                    TablerIcons.calendar,
                    color: widget.isDisabled ? OColor.gray400 : OColor.gray600,
                    size: 16,
                  ),
                  const SizedBox(width: OSpacing.xxs),
                  OText(
                    text: "Date," + " " + "Start time -" + " " + "End time",
                    style: OTextStyle.labelSmall.copyWith(
                      color:
                          widget.isDisabled ? OColor.gray400 : OColor.gray600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: OSpacing.s),
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(OCornerRadius.xl),
                  color: OColor.gray400,
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://variety.com/wp-content/uploads/2019/10/shutterstock_editorial_10435445et.jpg?w=1000&h=667&crop=1",
                    ),
                    fit: BoxFit.cover,
                    opacity: 1,
                  ),
                ),
              ),
              const SizedBox(width: OSpacing.xs),
              OText(
                text: "Student's Web Committee",
                style: OTextStyle.labelSmall.copyWith(
                  color: widget.isDisabled ? OColor.gray600 : OColor.gray600,
                ),
              ),
            ],
          ),
          _buildTypeSpecificContent(),
        ],
      ),
    );
  }

  Widget _buildTypeSpecificContent() {
    return switch (widget.type) {
      EventCardType.upcomingUser => Row(
        children: [
        ],
      ),
      EventCardType.pastUser => Column(
        children: [
          const SizedBox(height: OSpacing.s),
          Divider(color: OColor.gray200),
          const SizedBox(height: OSpacing.s),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: OSpacing.m),
              OText(
                text: "+ 350 Others",
                style: OTextStyle.labelXSmall.copyWith(
                  color: widget.isDisabled ? OColor.gray400 : OColor.blue600,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: OSpacing.xs,
                  horizontal: OSpacing.s,
                ),
                decoration: BoxDecoration(
                  color: widget.isDisabled ? OColor.white : OColor.green600,
                  border: Border.all(
                    color:
                        widget.isDisabled ? OColor.gray400 : Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(OCornerRadius.l),
                ),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {},
                  child: Center(
                    child: Row(
                      children: [
                        Icon(
                          TablerIcons.heart,
                          color:
                              widget.isDisabled ? OColor.gray400 : OColor.white,
                          size: 16,
                        ),
                        const SizedBox(width: OSpacing.xs),
                        OText(
                          text: "I'm Going",
                          style: OTextStyle.labelSmall.copyWith(
                            color:
                                widget.isDisabled
                                    ? OColor.gray400
                                    : OColor.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      EventCardType.upcomingAdmin => Column(
        children: [
          const SizedBox(height: OSpacing.xs),
          Divider(color: OColor.gray200),
          const SizedBox(height: OSpacing.xs),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton.icon(
                onPressed: () {}, //widget.edit,
                icon: Icon(
                  TablerIcons.edit,
                  size: 16,
                  color: widget.isDisabled ? OColor.gray400 : OColor.green600,
                ),
                label: OText(
                  text: "Edit",
                  style: OTextStyle.labelSmall.copyWith(
                    color: widget.isDisabled ? OColor.gray400 : OColor.green600,
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: () {}, // widget.delete,
                icon: Icon(
                  TablerIcons.trash,
                  size: 16,
                  color: widget.isDisabled ? OColor.gray400 : OColor.red500,
                ),
                label: OText(
                  text: "Delete",
                  style: OTextStyle.labelSmall.copyWith(
                    color: widget.isDisabled ? OColor.gray400 : OColor.red500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      EventCardType.pastAdmin => Row(children: []),
    };
  }

  @ override
  void dispose(){
    super.dispose();
  }
}
