import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screltask/app/module/form/view%20model/email_campaign_provider.dart';

import '../../../helpers/common_widgets.dart';
import '../../../helpers/size_box.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/extentions.dart';
import '../model/form_steps_model.dart';

class DrawerWidget extends StatelessWidget {
  final bool? isDesktop;
  final double? topPading;
  const DrawerWidget({
    super.key,
    required this.formSteps,
    this.topPading,
    this.isDesktop = false,
  });

  final List<FormStepsModel> formSteps;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Drawer(
        child: Container(
      height: Responsive.height * 100,
      color: AppConstants.appWhiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: topPading ?? Responsive.height * 8),
              itemBuilder: (context, index) {
                FormStepsModel formStepsModel = formSteps[index];
                return DrawerItemWidget(
                  isDesktop: isDesktop ?? false,
                  formStepsModel: formStepsModel,
                  index: index,
                );
              },
              separatorBuilder: (context, index) {
                return const SizeBoxH(5);
              },
              itemCount: formSteps.length),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonTextWidget(
                    color: AppConstants.appSecondaryColor,
                    text: "Need Help?",
                    fontSize: (isDesktop ?? false)
                        ? Responsive.text * 1.3
                        : Responsive.text * 2,
                    fontWeight: FontWeight.bold),
                const SizeBoxH(5),
                CommonTextWidget(
                    align: TextAlign.start,
                    color: AppConstants.appGreyColor2.withOpacity(.7),
                    text:
                        "Get to know how your campaign\ncan reach a wider audience.",
                    fontSize: (isDesktop ?? false)
                        ? Responsive.text * .8
                        : Responsive.text * 1.4,
                    fontWeight: FontWeight.bold),
                SizeBoxH(Responsive.height * 2),
                CommonButton(
                  ontap: () {},
                  height: 42,
                  width: (isDesktop ?? false)
                      ? Responsive.width * 20
                      : Responsive.width * 30,
                  text: "Contact Us",
                  textColor: AppConstants.appSecondaryColor.withOpacity(.7),
                  fontSize: (isDesktop ?? false)
                      ? Responsive.text * .9
                      : Responsive.text * 1.4,
                  fontWeight: FontWeight.w600,
                  bgColor: Colors.transparent,
                  borderColor: AppConstants.appSecondaryColor.withOpacity(.75),
                  borderRadius: BorderRadius.circular(10),
                ),
                SizeBoxH(Responsive.height * 1),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class DrawerItemWidget extends ConsumerWidget {
  final int index;
  const DrawerItemWidget({
    super.key,
    required this.formStepsModel,
    required this.index,
    this.isDesktop = false,
  });

  final FormStepsModel formStepsModel;
  final bool isDesktop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FormStepsModel? nextForm = ref.watch(formProvider).nextStep;
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 10, right: 10),
      leading: Container(
        height: isDesktop ? 45 : 50,
        width: isDesktop ? 45 : 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: nextForm?.title == formStepsModel.title
                ? AppConstants.appPrimaryColor
                : AppConstants.appWhiteColor,
            border: Border.all(
                color: nextForm?.title == formStepsModel.title
                    ? AppConstants.appPrimaryColor
                    : AppConstants.appGreyColor2)),
        child: Center(
          child: CommonTextWidget(
              color: nextForm?.title == formStepsModel.title
                  ? AppConstants.appWhiteColor
                  : AppConstants.appGreyColor2,
              fontSize: Responsive.text * 2,
              fontWeight: FontWeight.w600,
              text: "${index + 1}"),
        ),
      ),
      title: CommonTextWidget(
        align: TextAlign.start,
        color: AppConstants.appSecondaryColor,
        text: formStepsModel.title,
        fontWeight: FontWeight.w600,
        fontSize: isDesktop ? Responsive.text * .9 : Responsive.text * 1.55,
      ),
      subtitle: CommonTextWidget(
        align: TextAlign.start,
        color: AppConstants.appSecondaryColor,
        text: formStepsModel.label,
        fontWeight: FontWeight.w500,
        fontSize: isDesktop ? Responsive.text * .8 : Responsive.text * 1.2,
      ),
    );
  }
}
