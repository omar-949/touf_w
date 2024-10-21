class PolicyModel {
  final String? policy;
  final String? code;

  PolicyModel({this.policy, this.code});

  factory PolicyModel.fromJson(Map<String, dynamic> json) => PolicyModel(
        policy: json['policy'] as String?,
        code: json['code'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'policy': policy,
        'code': code,
      };
}
