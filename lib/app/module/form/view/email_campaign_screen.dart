import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screltask/app/helpers/common_widgets.dart';
import 'package:screltask/app/helpers/size_box.dart';
import 'package:screltask/app/module/form/model/form_steps_model.dart';
import 'package:screltask/app/module/form/view%20model/email_campaign_provider.dart';
import 'package:screltask/app/utils/app_constants.dart';
import 'package:screltask/app/utils/extentions.dart';

import '../widgets/drawer_widget.dart';
import '../widgets/heading_widget.dart';
import '../widgets/home_screen_customer_choose_section.dart';
import 'mobile/mobile_layout_widget.dart';
import 'tablet/tablet_layout_widget.dart';

class EmailCampaignScreen extends StatelessWidget {
  EmailCampaignScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(
    BuildContext context,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        log(constraints.toString());
        if (constraints.maxWidth >= 950) {
          return DesktopLayoutWidget(
            formKey: _formKey,
          );
        } else if (constraints.maxWidth > 600) {
          return TabletLayoutWidget(
            formKey: _formKey,
          );
        }
        return MobileLayoutWidget(formKey: _formKey);
      },
    );
  }
}

class DesktopLayoutWidget extends ConsumerWidget {
  const DesktopLayoutWidget({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<FormStepsModel> formSteps = ref.watch(formProvider).formSteps;
    return Scaffold(
      backgroundColor: AppConstants.appWhiteColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Align(
                            alignment: Alignment.center,
                            child: HeadingWidget()),
                        SizeBoxH(Responsive.height * 5),
                        const TextFieldLabelWidget(
                          label: "Campaign Subject",
                        ),
                        const SizeBoxH(5),
                        CustomTextFormFieldWidget(
                          width: MediaQuery.of(context).size.width * 1,
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
                          width: MediaQuery.of(context).size.width * 1,
                          controller:
                              ref.read(formProvider).previewTextController,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const TextFieldLabelWidget(
                                  label: "'From' Name",
                                ),
                                const SizeBoxH(5),
                                CustomTextFormFieldWidget(
                                  width: MediaQuery.of(context).size.width * .2,
                                  controller:
                                      ref.read(formProvider).fromNameController,
                                  hintText: "From Anne",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter name';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                            // const SizeBoxV(26),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const TextFieldLabelWidget(
                                  label: "'From' Email",
                                ),
                                const SizeBoxH(5),
                                CustomTextFormFieldWidget(
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.done,
                                  width: MediaQuery.of(context).size.width * .2,
                                  controller: ref
                                      .read(formProvider)
                                      .fromEmailController,
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
                              ],
                            ),
                          ],
                        ),
                        const FormScreenCustomerChooseSectionWidget(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonButton(
                              height: 38,
                              width: MediaQuery.of(context).size.width * .1,
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
                              width: MediaQuery.of(context).size.width * .2,
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
              DrawerWidget(
                formSteps: formSteps,
                isDesktop: true,
                topPading: Responsive.height * 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
