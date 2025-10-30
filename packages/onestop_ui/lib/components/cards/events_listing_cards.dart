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
  bool _isSaved = true;

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
        padding: const EdgeInsets.symmetric(
          horizontal: OSpacing.xs,
          vertical: OSpacing.xs,
        ),
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
                        color: OColor.gray800,
                      ),
                    ),
                    if (_isSaved == true)
                      Row(
                        children: [
                          Icon(
                            TablerIcons.check,
                            size: 16,
                            color: OColor.green600,
                          ),
                          const SizedBox(width: OSpacing.xxs),
                          OText(
                            text: "I'm going",
                            style: OTextStyle.labelXSmall.copyWith(
                              color: OColor.green600,
                            ),
                          ),
                        ],
                      ),
                    OText(
                      text: "Time," + "Location",
                      style: OTextStyle.bodySmall.copyWith(
                        color: OColor.gray600,
                      ),
                    ),
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
                                color: OColor.blue600,
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
                                color: OColor.green600,
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
              color: widget.isDisabled ? OColor.gray300 : OColor.gray600,
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
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 18 ,
            fontWeight: FontWeight.bold,
            color: widget.isDisabled ? Colors.grey : Colors.black,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          widget.date,
          style: TextStyle(
            fontSize: widget.size == EventCardSize.small ? 12 : 14,
            color: widget.isDisabled ? Colors.grey : Colors.black54,
          ),
        ),
       if (widget.size == EventCardSize.large) ...[
          const SizedBox(height: 8),
          _buildTypeSpecificContent(),
        ],
      ],
    );
  }

  Widget _buildTypeSpecificContent() {
    return switch (widget.type) {
      EventCardType.upcomingUser => Row(
        children: [
          Icon(TablerIcons.arrow_rotary_first_left, size: 16),
          const SizedBox(width: 4),
          Text("Register Now"),
        ],
      ),
      EventCardType.pastUser => Row(
        children: [
          Icon(TablerIcons.arrow_rotary_first_left, size: 16),
          const SizedBox(width: 4),
          Text("View Details"),
        ],
      ),
      EventCardType.upcomingAdmin => Row(
        children: [
          Icon(TablerIcons.arrow_rotary_first_left, size: 16),
          const SizedBox(width: 4),
          Text("Manage Event"),
        ],
      ),
      EventCardType.pastAdmin => Row(
        children: [
          Icon(TablerIcons.arrow_rotary_first_left, size: 16),
          const SizedBox(width: 4),
          Text("View Analytics"),
        ],
      ),
    };
  }
}
