import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/size_box.dart';
import '../../../utils/app_constants.dart';
import '../view model/email_campaign_provider.dart';
import 'text_and_switch_row_widget.dart';

class FormScreenCustomerChooseSectionWidget extends ConsumerWidget {
  const FormScreenCustomerChooseSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizeBoxH(15),
        Divider(
          color: AppConstants.appGreyColor.withOpacity(.4),
          thickness: 1,
        ),
        const SizeBoxH(15),
        TextAndSwitchButtonWidget(
            isSwitched: ref.watch(formProvider).isOncePerCustomer,
            onChanged: (p0) {
              ref.read(formProvider).checkIsOncePerCustomer();
            },
            text: "Run only once per customer"),
        TextAndSwitchButtonWidget(
            isSwitched: ref.watch(formProvider).isCustomAudience,
            onChanged: (p0) {
              ref.read(formProvider).checkIsCustomAudience();
            },
            text: "Custom audience"),
        const SizeBoxH(10),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: 'You can set up a ',
                style: TextStyle(
                    color: AppConstants.appGreyColor2, // First word color
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              TextSpan(
                text: 'custom domain or connect your email service provider ',
                style: TextStyle(
                    color: AppConstants.appPrimaryLightColor
                        .withOpacity(.6), // First word color
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              const TextSpan(
                text: 'to change this',
                style: TextStyle(
                    color: AppConstants.appGreyColor2, // First word color
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          textAlign: TextAlign.center, // Align the text to center
        ),
        const SizeBoxH(15),
        Divider(
          color: AppConstants.appGreyColor.withOpacity(.4),
          thickness: 1,
        ),
        const SizeBoxH(15),
      ],
    );
  }
}
