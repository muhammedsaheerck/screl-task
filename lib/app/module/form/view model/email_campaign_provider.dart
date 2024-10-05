import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/common_widgets.dart';
import '../../../utils/app_constants.dart';
import '../model/form_steps_model.dart';

class EmailCampaignProvider extends ChangeNotifier {
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController previewTextController = TextEditingController();
  final TextEditingController fromNameController = TextEditingController();
  final TextEditingController fromEmailController = TextEditingController();
  List<FormStepsModel> formSteps = [
    const FormStepsModel(
      itemId: 1,
      title: 'Create New Email Campaign',
      label: 'Fill out these details to build your broadcast',
      status: Status.completed,
    ),
    const FormStepsModel(
      itemId: 2,
      title: 'Create Segments',
      label: 'Get full control over your audience',
      status: Status.pending,
    ),
    const FormStepsModel(
      itemId: 3,
      title: 'Bidding Strategy',
      label: 'Optimize your campaign reach with adsense',
      status: Status.pending,
    ),
    const FormStepsModel(
      itemId: 4,
      title: 'Site Links',
      label: 'Setup your customer journy flow',
      status: Status.pending,
    ),
    const FormStepsModel(
      itemId: 5,
      title: 'Review Campaign',
      label: 'Double check your campaign is ready to go!',
      status: Status.pending,
    ),
  ];

  bool _isOncePerCustomer = false;
  bool get isOncePerCustomer => _isOncePerCustomer;

  void checkIsOncePerCustomer() {
    _isOncePerCustomer = !_isOncePerCustomer;
    notifyListeners();
  }

  bool _isCustomAudience = false;
  bool get isCustomAudience => _isCustomAudience;

  void checkIsCustomAudience() {
    _isCustomAudience = !_isCustomAudience;
    notifyListeners();
  }

  FormStepsModel? nextStep = const FormStepsModel(
    itemId: 1,
    title: 'Create New Email Campaign',
    label: 'Fill out these details to build your broadcast',
    status: Status.completed,
  );

  // Method to update the status of a form step at a given index
  void updateStepStatus(int index) {
    if (index >= 0 && index < formSteps.length) {
      subjectController.clear();
      previewTextController.clear();
      fromNameController.clear();
      fromEmailController.clear();
      // Update the current step status to completed
      formSteps[index] = formSteps[index].copyWith(status: Status.completed);

      // Set the next step
      if (index + 1 < formSteps.length) {
        nextStep = formSteps[index + 1];
      } else {
        nextStep = formSteps[0]; // No next step available
      }

      notifyListeners(); // Notify listeners to rebuild the UI
    }
  }

  void nextStepFun(BuildContext context) {
    if (isCustomAudience == true || isOncePerCustomer == true) {
      if (nextStep?.itemId == 1) {
        updateStepStatus(0);
      } else if (nextStep?.itemId == 2) {
        updateStepStatus(1);
      } else if (nextStep?.itemId == 3) {
        updateStepStatus(2);
      } else if (nextStep?.itemId == 4) {
        updateStepStatus(3);
      } else if (nextStep?.itemId == 5) {
        updateStepStatus(4);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: CommonTextWidget(
            text: 'Please select at least one audience',
            fontSize: 16,
            color: AppConstants.appWhiteColor,
          ),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}

final formProvider = ChangeNotifierProvider<EmailCampaignProvider>(
  (ref) => EmailCampaignProvider(),
);
