import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_ui/index.dart';

class ModalDemo extends StatelessWidget {
  const ModalDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          OModalBasic(
            buttonIcon1: TablerIcons.arrow_rotary_first_left,
            buttonIcon2: TablerIcons.arrow_rotary_first_left,
            buttonLabel1: "Label 1",
            buttonLabel2: "Label 2",
            buttonPressed1: () {},
            buttonPressed2: () {},
            headerButtonIcon: TablerIcons.arrow_rotary_first_left,
            headerButtonPressed: () {},
            headerIcon: TablerIcons.arrow_rotary_first_left,
            modalImageURl:
                "https://variety.com/wp-content/uploads/2019/10/shutterstock_editorial_10435445et.jpg?w=1000&h=667&crop=1",
            heading: "Modal Heading",
            subheading: "Modal subheading",
            body:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
          ),
          OModalSecondary(
            heading: 'Modal Heading',
            modalImageURl:
                "https://variety.com/wp-content/uploads/2019/10/shutterstock_editorial_10435445et.jpg?w=1000&h=667&crop=1",
            headerIcon: TablerIcons.user,
            headerButtonPressed: () {},
            headerButtonIcon: TablerIcons.x,
            userHeading: "John Doe",
            userSubheading: "johndoe.com",
            userEmail: "johndoe@ex.com",
            userPhone: "+919876543210",
            userImageURl:
                "https://variety.com/wp-content/uploads/2019/10/shutterstock_editorial_10435445et.jpg?w=1000&h=667&crop=1",
            bannerHeading: "Important",
            bannerBody:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
            buttonPressed2: () {},
            buttonPressed1: () {},
            buttonPressed3: () {},
            buttonPressed4: () {},
            buttonPressed5: () {},
            buttonLabel2: "call",
            buttonLabel1: "text",
            buttonIcon2: TablerIcons.arrow_rotary_first_left,
            buttonIcon1: TablerIcons.arrow_rotary_first_left,
            buttonIcon3: TablerIcons.arrow_rotary_first_left,
            buttonIcon4: TablerIcons.arrow_rotary_first_left,
            buttonLabel3: "mail",
            buttonLabel4: "Accept",
            buttonLabel5: "Reject",
          ),
          OModalHeader(
            heading: "Modal Heading",
            subheading: "Modal Subheading",
            onPressed: () {},
            buttonIcon: TablerIcons.arrow_rotary_first_left,
            icon: TablerIcons.arrow_rotary_first_left,
            iconColor: OColor.gray600,
          ),
          OModalHeader(
            heading: "Modal Heading",
            subheading: "Modal Subheading",
            onPressed: () {},
            imageURl:
                "https://variety.com/wp-content/uploads/2019/10/shutterstock_editorial_10435445et.jpg?w=1000&h=667&crop=1",
            buttonIcon: TablerIcons.arrow_rotary_first_left,
          ),
          OModalHeader(
            heading: "Modal Heading",
            subheading: "Modal Subheading",
            onPressed: () {},
            buttonIcon: TablerIcons.arrow_rotary_first_left,
          ),
          OModalBanner(
            icon: TablerIcons.arrow_rotary_first_left,
            body:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
            heading: "Banner heading",
            label: "label",
          ),
        ],
      ),
    );
  }
}
