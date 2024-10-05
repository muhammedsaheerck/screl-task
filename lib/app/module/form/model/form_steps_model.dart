// Enum to define the status of the form step

enum Status {
  completed,
  pending,
}

// Model class for Form Steps

class FormStepsModel {
  final int itemId;
  final String title;
  final String label;
  final Status status;

  const FormStepsModel({
    required this.itemId,
    required this.title,
    required this.label,
    required this.status,
  });

  FormStepsModel copyWith({
    int? itemId,
    String? title,
    String? label,
    Status? status,
  }) {
    return FormStepsModel(
      itemId: itemId ?? this.itemId,
      title: title ?? this.title,
      label: label ?? this.label,
      status: status ?? this.status,
    );
  }
}
