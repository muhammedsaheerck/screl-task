import 'package:hive_flutter/adapters.dart';
import 'package:screltask/app/module/form/model/form_steps_model.dart';

part 'form_model.g.dart';

@HiveType(typeId: 0)
class FormModel {
  FormModel({
    required this.id,
    required this.subject,
    required this.description,
    required this.name,
    required this.email,
    required this.isOnceCustomer,
    required this.isCustomAudience,
    required this.formStepsModel,
  });

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String subject;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String name;
  @HiveField(4)
  final String email;
  @HiveField(5)
  final bool isOnceCustomer;
  @HiveField(6)
  final bool isCustomAudience;
  @HiveField(7)
  final FormStepsModel formStepsModel;
}
