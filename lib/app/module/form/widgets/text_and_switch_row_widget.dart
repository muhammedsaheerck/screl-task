import 'package:flutter/material.dart';

import '../../../helpers/common_widgets.dart';
import '../../../utils/app_constants.dart';

class TextAndSwitchButtonWidget extends StatelessWidget {
  final bool isSwitched;
  final void Function(bool)? onChanged;
  final String text;
  const TextAndSwitchButtonWidget({
    super.key,
    required this.isSwitched,
    this.onChanged,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommonTextWidget(
          color: isSwitched
              ? AppConstants.appSecondaryColor
              : AppConstants.appGreyColor2,
          text: text,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        Transform.scale(
          scale: 0.7,
          child: Switch(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: isSwitched,
            onChanged: onChanged,
            activeColor: Colors.white,
            inactiveThumbColor: Colors.white,
            activeTrackColor: Colors.deepOrange,
            inactiveTrackColor: AppConstants.appGreyColor,
            trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
          ),
        ),
      ],
    );
  }
}
