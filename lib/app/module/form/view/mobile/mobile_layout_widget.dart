import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../helpers/common_widgets.dart';
import '../../../../helpers/size_box.dart';
import '../../../../utils/app_constants.dart';
import '../../../../utils/extentions.dart';
import '../../model/form_steps_model.dart';
import '../../view model/email_campaign_provider.dart';
import '../../widgets/drawer_widget.dart';
import '../../widgets/heading_widget.dart';
import '../../widgets/text_and_switch_row_widget.dart';

class MobileLayoutWidget extends ConsumerWidget {
  const MobileLayoutWidget({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<FormStepsModel> formSteps = ref.watch(formProvider).formSteps;
    return Scaffold(
      backgroundColor: AppConstants.appWhiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      drawer: DrawerWidget(formSteps: formSteps),
      body: Container(
        margin: const EdgeInsets.all(16),
        height: Responsive.height * 100,
        width: Responsive.width * 100,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                    alignment: Alignment.center, child: HeadingWidget()),
                SizeBoxH(Responsive.height * 5),
                const TextFieldLabelWidget(
                  label: "Campaign Subject",
                ),
                const SizeBoxH(5),
                CustomTextFormFieldWidget(
                  controller: ref.read(formProvider).subjectController,
                  hintText: "Enter Subject",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter subject';
                    }
                    return null;
                  },
                ),
                const SizeBoxH(20),
                const TextFieldLabelWidget(
                  label: "Preview text",
                ),
                const SizeBoxH(5),
                CustomTextFormFieldWidget(
                  controller: ref.read(formProvider).previewTextController,
                  hintText: "Enter text here...",
                  maxLines: 3,
                  maxLength: 50,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter text';
                    }
                    return null;
                  },
                ),
                const SizeBoxH(5),
                const CommonTextWidget(
                    fontSize: 12,
                    color: AppConstants.appGreyColor2,
                    fontWeight: FontWeight.w500,
                    text: "Keep this simple of 50 charecters"),
                const SizeBoxH(20),
                const TextFieldLabelWidget(
                  label: "'From' Name",
                ),
                const SizeBoxH(5),
                CustomTextFormFieldWidget(
                  controller: ref.read(formProvider).fromNameController,
                  hintText: "From Anne",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                ),
                const SizeBoxH(20),
                const TextFieldLabelWidget(
                  label: "'From' Email",
                ),
                const SizeBoxH(5),
                CustomTextFormFieldWidget(
                  controller: ref.read(formProvider).fromEmailController,
                  hintText: "Anne@example.com",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    } else if (!RegExp(
                            r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
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
                            color:
                                AppConstants.appGreyColor2, // First word color
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text:
                            'custom domain or connect your email service provider ',
                        style: TextStyle(
                            color: AppConstants.appPrimaryLightColor
                                .withOpacity(.6), // First word color
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      const TextSpan(
                        text: 'to change this',
                        style: TextStyle(
                            color:
                                AppConstants.appGreyColor2, // First word color
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonButton(
                      height: 38,
                      width: Responsive.width * 30,
                      borderColor: AppConstants.appPrimaryColor,
                      bgColor: AppConstants.appWhiteColor,
                      textColor: AppConstants.appPrimaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      ontap: () {},
                      text: "Save Draft",
                    ),
                    CommonButton(
                      height: 38,
                      width: Responsive.width * 55,
                      borderColor: AppConstants.appPrimaryColor,
                      bgColor: AppConstants.appPrimaryColor,
                      textColor: AppConstants.appWhiteColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      ontap: () {
                        if (_formKey.currentState!.validate()) {
                          ref.read(formProvider).nextStepFun(context);
                        }
                      },
                      text: "Next Step",
                    )
                  ],
                ),
                const SizeBoxH(15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
