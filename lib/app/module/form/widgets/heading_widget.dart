import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screltask/app/module/form/model/form_steps_model.dart';
import 'package:screltask/app/module/form/view%20model/email_campaign_provider.dart';

import '../../../helpers/common_widgets.dart';
import '../../../helpers/size_box.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/extentions.dart';

class HeadingWidget extends ConsumerWidget {
  const HeadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FormStepsModel? formStepsModel = ref.watch(formProvider).nextStep;
    return Column(
      children: [
        SizeBoxH(Responsive.height * 2),
        CommonTextWidget(
            color: AppConstants.appSecondaryColor,
            text: formStepsModel?.title ?? "",
            fontSize: 20,
            fontWeight: FontWeight.bold),
        const SizeBoxH(5),
        CommonTextWidget(
            color: AppConstants.appGreyColor2,
            fontSize: 14,
            text: formStepsModel?.label ?? ''),
      ],
    );
  }
}
