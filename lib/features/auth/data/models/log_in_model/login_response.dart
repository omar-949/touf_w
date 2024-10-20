class LoginResponse {
  int? custCode;
  String? name;
  String? telephone;
  String? email;
  String token;

  LoginResponse({
    this.custCode,
    this.name,
    this.telephone,
    this.email,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        custCode: json['CustCode'] as int?,
        name: json['NAME'] as String?,
        telephone: json['TELEPHONE'] as String?,
        email: json['EMAIL'] as String?,
        token: json['Token '] as String,
      );

  Map<String, dynamic> toJson() => {
        'CustCode': custCode,
        'NAME': name,
        'TELEPHONE': telephone,
        'EMAIL': email,
        'Token ': token,
      };
}