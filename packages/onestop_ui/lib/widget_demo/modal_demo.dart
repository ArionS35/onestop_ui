import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_ui/components/modalcomponents/modal_header.dart';

class ModalDemo extends StatelessWidget {
  const ModalDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          OModalHeader(
            heading: "Modal Heading",
            subheading: "Modal Subheading",
            onPressed: () {},
            buttonIcon: TablerIcons.arrow_rotary_first_left,
            icon: TablerIcons.arrow_rotary_first_left,
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
        ],
      ),
    );
  }
}
